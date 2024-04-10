; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43192 () Bool)

(assert start!43192)

(declare-fun b!478714 () Bool)

(declare-fun res!285606 () Bool)

(declare-fun e!281506 () Bool)

(assert (=> b!478714 (=> (not res!285606) (not e!281506))))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-datatypes ((array!30839 0))(
  ( (array!30840 (arr!14827 (Array (_ BitVec 32) (_ BitVec 64))) (size!15185 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!30839)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-datatypes ((V!19179 0))(
  ( (V!19180 (val!6838 Int)) )
))
(declare-datatypes ((ValueCell!6429 0))(
  ( (ValueCellFull!6429 (v!9127 V!19179)) (EmptyCell!6429) )
))
(declare-datatypes ((array!30841 0))(
  ( (array!30842 (arr!14828 (Array (_ BitVec 32) ValueCell!6429)) (size!15186 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!30841)

(assert (=> b!478714 (= res!285606 (and (= (size!15186 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15185 _keys!1874) (size!15186 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun res!285605 () Bool)

(assert (=> start!43192 (=> (not res!285605) (not e!281506))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43192 (= res!285605 (validMask!0 mask!2352))))

(assert (=> start!43192 e!281506))

(assert (=> start!43192 true))

(declare-fun e!281505 () Bool)

(declare-fun array_inv!10696 (array!30841) Bool)

(assert (=> start!43192 (and (array_inv!10696 _values!1516) e!281505)))

(declare-fun array_inv!10697 (array!30839) Bool)

(assert (=> start!43192 (array_inv!10697 _keys!1874)))

(declare-fun b!478715 () Bool)

(declare-fun e!281504 () Bool)

(declare-fun tp_is_empty!13581 () Bool)

(assert (=> b!478715 (= e!281504 tp_is_empty!13581)))

(declare-fun b!478716 () Bool)

(declare-fun e!281507 () Bool)

(declare-fun mapRes!22066 () Bool)

(assert (=> b!478716 (= e!281505 (and e!281507 mapRes!22066))))

(declare-fun condMapEmpty!22066 () Bool)

(declare-fun mapDefault!22066 () ValueCell!6429)

(assert (=> b!478716 (= condMapEmpty!22066 (= (arr!14828 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6429)) mapDefault!22066)))))

(declare-fun b!478717 () Bool)

(assert (=> b!478717 (= e!281507 tp_is_empty!13581)))

(declare-fun b!478718 () Bool)

(assert (=> b!478718 (= e!281506 false)))

(declare-fun lt!217756 () Bool)

(declare-datatypes ((List!9066 0))(
  ( (Nil!9063) (Cons!9062 (h!9918 (_ BitVec 64)) (t!15272 List!9066)) )
))
(declare-fun arrayNoDuplicates!0 (array!30839 (_ BitVec 32) List!9066) Bool)

(assert (=> b!478718 (= lt!217756 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9063))))

(declare-fun mapNonEmpty!22066 () Bool)

(declare-fun tp!42541 () Bool)

(assert (=> mapNonEmpty!22066 (= mapRes!22066 (and tp!42541 e!281504))))

(declare-fun mapKey!22066 () (_ BitVec 32))

(declare-fun mapRest!22066 () (Array (_ BitVec 32) ValueCell!6429))

(declare-fun mapValue!22066 () ValueCell!6429)

(assert (=> mapNonEmpty!22066 (= (arr!14828 _values!1516) (store mapRest!22066 mapKey!22066 mapValue!22066))))

(declare-fun mapIsEmpty!22066 () Bool)

(assert (=> mapIsEmpty!22066 mapRes!22066))

(declare-fun b!478719 () Bool)

(declare-fun res!285604 () Bool)

(assert (=> b!478719 (=> (not res!285604) (not e!281506))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30839 (_ BitVec 32)) Bool)

(assert (=> b!478719 (= res!285604 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(assert (= (and start!43192 res!285605) b!478714))

(assert (= (and b!478714 res!285606) b!478719))

(assert (= (and b!478719 res!285604) b!478718))

(assert (= (and b!478716 condMapEmpty!22066) mapIsEmpty!22066))

(assert (= (and b!478716 (not condMapEmpty!22066)) mapNonEmpty!22066))

(get-info :version)

(assert (= (and mapNonEmpty!22066 ((_ is ValueCellFull!6429) mapValue!22066)) b!478715))

(assert (= (and b!478716 ((_ is ValueCellFull!6429) mapDefault!22066)) b!478717))

(assert (= start!43192 b!478716))

(declare-fun m!460889 () Bool)

(assert (=> start!43192 m!460889))

(declare-fun m!460891 () Bool)

(assert (=> start!43192 m!460891))

(declare-fun m!460893 () Bool)

(assert (=> start!43192 m!460893))

(declare-fun m!460895 () Bool)

(assert (=> b!478718 m!460895))

(declare-fun m!460897 () Bool)

(assert (=> mapNonEmpty!22066 m!460897))

(declare-fun m!460899 () Bool)

(assert (=> b!478719 m!460899))

(check-sat (not b!478718) (not start!43192) (not b!478719) tp_is_empty!13581 (not mapNonEmpty!22066))
(check-sat)

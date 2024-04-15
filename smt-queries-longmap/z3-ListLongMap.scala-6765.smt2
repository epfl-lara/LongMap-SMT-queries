; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84868 () Bool)

(assert start!84868)

(declare-fun b!991732 () Bool)

(declare-fun res!662920 () Bool)

(declare-fun e!559385 () Bool)

(assert (=> b!991732 (=> (not res!662920) (not e!559385))))

(declare-fun extraKeys!1472 () (_ BitVec 32))

(declare-datatypes ((V!36137 0))(
  ( (V!36138 (val!11733 Int)) )
))
(declare-datatypes ((ValueCell!11201 0))(
  ( (ValueCellFull!11201 (v!14309 V!36137)) (EmptyCell!11201) )
))
(declare-datatypes ((array!62634 0))(
  ( (array!62635 (arr!30162 (Array (_ BitVec 32) ValueCell!11201)) (size!30643 (_ BitVec 32))) )
))
(declare-fun _values!1551 () array!62634)

(declare-fun mask!2471 () (_ BitVec 32))

(declare-datatypes ((array!62636 0))(
  ( (array!62637 (arr!30163 (Array (_ BitVec 32) (_ BitVec 64))) (size!30644 (_ BitVec 32))) )
))
(declare-fun _keys!1945 () array!62636)

(assert (=> b!991732 (= res!662920 (and (= (size!30643 _values!1551) (bvadd #b00000000000000000000000000000001 mask!2471)) (= (size!30644 _keys!1945) (size!30643 _values!1551)) (bvsge mask!2471 #b00000000000000000000000000000000) (bvsge extraKeys!1472 #b00000000000000000000000000000000) (bvsle extraKeys!1472 #b00000000000000000000000000000011)))))

(declare-fun res!662919 () Bool)

(assert (=> start!84868 (=> (not res!662919) (not e!559385))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84868 (= res!662919 (validMask!0 mask!2471))))

(assert (=> start!84868 e!559385))

(assert (=> start!84868 true))

(declare-fun e!559383 () Bool)

(declare-fun array_inv!23309 (array!62634) Bool)

(assert (=> start!84868 (and (array_inv!23309 _values!1551) e!559383)))

(declare-fun array_inv!23310 (array!62636) Bool)

(assert (=> start!84868 (array_inv!23310 _keys!1945)))

(declare-fun mapNonEmpty!37119 () Bool)

(declare-fun mapRes!37119 () Bool)

(declare-fun tp!70191 () Bool)

(declare-fun e!559382 () Bool)

(assert (=> mapNonEmpty!37119 (= mapRes!37119 (and tp!70191 e!559382))))

(declare-fun mapRest!37119 () (Array (_ BitVec 32) ValueCell!11201))

(declare-fun mapValue!37119 () ValueCell!11201)

(declare-fun mapKey!37119 () (_ BitVec 32))

(assert (=> mapNonEmpty!37119 (= (arr!30162 _values!1551) (store mapRest!37119 mapKey!37119 mapValue!37119))))

(declare-fun b!991733 () Bool)

(declare-fun e!559384 () Bool)

(assert (=> b!991733 (= e!559383 (and e!559384 mapRes!37119))))

(declare-fun condMapEmpty!37119 () Bool)

(declare-fun mapDefault!37119 () ValueCell!11201)

(assert (=> b!991733 (= condMapEmpty!37119 (= (arr!30162 _values!1551) ((as const (Array (_ BitVec 32) ValueCell!11201)) mapDefault!37119)))))

(declare-fun b!991734 () Bool)

(declare-fun res!662918 () Bool)

(assert (=> b!991734 (=> (not res!662918) (not e!559385))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62636 (_ BitVec 32)) Bool)

(assert (=> b!991734 (= res!662918 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1945 mask!2471))))

(declare-fun mapIsEmpty!37119 () Bool)

(assert (=> mapIsEmpty!37119 mapRes!37119))

(declare-fun b!991735 () Bool)

(declare-fun tp_is_empty!23365 () Bool)

(assert (=> b!991735 (= e!559384 tp_is_empty!23365)))

(declare-fun b!991736 () Bool)

(assert (=> b!991736 (= e!559385 false)))

(declare-fun lt!439799 () Bool)

(declare-datatypes ((List!20903 0))(
  ( (Nil!20900) (Cons!20899 (h!22061 (_ BitVec 64)) (t!29877 List!20903)) )
))
(declare-fun arrayNoDuplicates!0 (array!62636 (_ BitVec 32) List!20903) Bool)

(assert (=> b!991736 (= lt!439799 (arrayNoDuplicates!0 _keys!1945 #b00000000000000000000000000000000 Nil!20900))))

(declare-fun b!991737 () Bool)

(assert (=> b!991737 (= e!559382 tp_is_empty!23365)))

(assert (= (and start!84868 res!662919) b!991732))

(assert (= (and b!991732 res!662920) b!991734))

(assert (= (and b!991734 res!662918) b!991736))

(assert (= (and b!991733 condMapEmpty!37119) mapIsEmpty!37119))

(assert (= (and b!991733 (not condMapEmpty!37119)) mapNonEmpty!37119))

(get-info :version)

(assert (= (and mapNonEmpty!37119 ((_ is ValueCellFull!11201) mapValue!37119)) b!991737))

(assert (= (and b!991733 ((_ is ValueCellFull!11201) mapDefault!37119)) b!991735))

(assert (= start!84868 b!991733))

(declare-fun m!918961 () Bool)

(assert (=> start!84868 m!918961))

(declare-fun m!918963 () Bool)

(assert (=> start!84868 m!918963))

(declare-fun m!918965 () Bool)

(assert (=> start!84868 m!918965))

(declare-fun m!918967 () Bool)

(assert (=> mapNonEmpty!37119 m!918967))

(declare-fun m!918969 () Bool)

(assert (=> b!991734 m!918969))

(declare-fun m!918971 () Bool)

(assert (=> b!991736 m!918971))

(check-sat (not start!84868) (not b!991736) (not mapNonEmpty!37119) (not b!991734) tp_is_empty!23365)
(check-sat)

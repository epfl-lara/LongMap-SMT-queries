; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43206 () Bool)

(assert start!43206)

(declare-fun b!478905 () Bool)

(declare-fun e!281679 () Bool)

(declare-fun tp_is_empty!13609 () Bool)

(assert (=> b!478905 (= e!281679 tp_is_empty!13609)))

(declare-fun b!478906 () Bool)

(declare-fun e!281675 () Bool)

(assert (=> b!478906 (= e!281675 tp_is_empty!13609)))

(declare-fun mapIsEmpty!22108 () Bool)

(declare-fun mapRes!22108 () Bool)

(assert (=> mapIsEmpty!22108 mapRes!22108))

(declare-fun mapNonEmpty!22108 () Bool)

(declare-fun tp!42583 () Bool)

(assert (=> mapNonEmpty!22108 (= mapRes!22108 (and tp!42583 e!281679))))

(declare-fun mapKey!22108 () (_ BitVec 32))

(declare-datatypes ((V!19217 0))(
  ( (V!19218 (val!6852 Int)) )
))
(declare-datatypes ((ValueCell!6443 0))(
  ( (ValueCellFull!6443 (v!9142 V!19217)) (EmptyCell!6443) )
))
(declare-fun mapValue!22108 () ValueCell!6443)

(declare-fun mapRest!22108 () (Array (_ BitVec 32) ValueCell!6443))

(declare-datatypes ((array!30880 0))(
  ( (array!30881 (arr!14847 (Array (_ BitVec 32) ValueCell!6443)) (size!15205 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!30880)

(assert (=> mapNonEmpty!22108 (= (arr!14847 _values!1516) (store mapRest!22108 mapKey!22108 mapValue!22108))))

(declare-fun b!478907 () Bool)

(declare-fun e!281676 () Bool)

(assert (=> b!478907 (= e!281676 (and e!281675 mapRes!22108))))

(declare-fun condMapEmpty!22108 () Bool)

(declare-fun mapDefault!22108 () ValueCell!6443)

(assert (=> b!478907 (= condMapEmpty!22108 (= (arr!14847 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6443)) mapDefault!22108)))))

(declare-fun b!478908 () Bool)

(declare-fun e!281677 () Bool)

(assert (=> b!478908 (= e!281677 false)))

(declare-fun lt!217810 () Bool)

(declare-datatypes ((array!30882 0))(
  ( (array!30883 (arr!14848 (Array (_ BitVec 32) (_ BitVec 64))) (size!15206 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!30882)

(declare-datatypes ((List!8987 0))(
  ( (Nil!8984) (Cons!8983 (h!9839 (_ BitVec 64)) (t!15185 List!8987)) )
))
(declare-fun arrayNoDuplicates!0 (array!30882 (_ BitVec 32) List!8987) Bool)

(assert (=> b!478908 (= lt!217810 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!8984))))

(declare-fun b!478909 () Bool)

(declare-fun res!285724 () Bool)

(assert (=> b!478909 (=> (not res!285724) (not e!281677))))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30882 (_ BitVec 32)) Bool)

(assert (=> b!478909 (= res!285724 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!478910 () Bool)

(declare-fun res!285725 () Bool)

(assert (=> b!478910 (=> (not res!285725) (not e!281677))))

(declare-fun extraKeys!1437 () (_ BitVec 32))

(assert (=> b!478910 (= res!285725 (and (= (size!15205 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15206 _keys!1874) (size!15205 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun res!285723 () Bool)

(assert (=> start!43206 (=> (not res!285723) (not e!281677))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43206 (= res!285723 (validMask!0 mask!2352))))

(assert (=> start!43206 e!281677))

(assert (=> start!43206 true))

(declare-fun array_inv!10788 (array!30880) Bool)

(assert (=> start!43206 (and (array_inv!10788 _values!1516) e!281676)))

(declare-fun array_inv!10789 (array!30882) Bool)

(assert (=> start!43206 (array_inv!10789 _keys!1874)))

(assert (= (and start!43206 res!285723) b!478910))

(assert (= (and b!478910 res!285725) b!478909))

(assert (= (and b!478909 res!285724) b!478908))

(assert (= (and b!478907 condMapEmpty!22108) mapIsEmpty!22108))

(assert (= (and b!478907 (not condMapEmpty!22108)) mapNonEmpty!22108))

(get-info :version)

(assert (= (and mapNonEmpty!22108 ((_ is ValueCellFull!6443) mapValue!22108)) b!478905))

(assert (= (and b!478907 ((_ is ValueCellFull!6443) mapDefault!22108)) b!478906))

(assert (= start!43206 b!478907))

(declare-fun m!461239 () Bool)

(assert (=> mapNonEmpty!22108 m!461239))

(declare-fun m!461241 () Bool)

(assert (=> b!478908 m!461241))

(declare-fun m!461243 () Bool)

(assert (=> b!478909 m!461243))

(declare-fun m!461245 () Bool)

(assert (=> start!43206 m!461245))

(declare-fun m!461247 () Bool)

(assert (=> start!43206 m!461247))

(declare-fun m!461249 () Bool)

(assert (=> start!43206 m!461249))

(check-sat (not b!478909) (not b!478908) tp_is_empty!13609 (not start!43206) (not mapNonEmpty!22108))
(check-sat)

; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43212 () Bool)

(assert start!43212)

(declare-fun b!478959 () Bool)

(declare-fun e!281724 () Bool)

(declare-fun tp_is_empty!13615 () Bool)

(assert (=> b!478959 (= e!281724 tp_is_empty!13615)))

(declare-fun b!478960 () Bool)

(declare-fun e!281721 () Bool)

(declare-fun mapRes!22117 () Bool)

(assert (=> b!478960 (= e!281721 (and e!281724 mapRes!22117))))

(declare-fun condMapEmpty!22117 () Bool)

(declare-datatypes ((V!19225 0))(
  ( (V!19226 (val!6855 Int)) )
))
(declare-datatypes ((ValueCell!6446 0))(
  ( (ValueCellFull!6446 (v!9145 V!19225)) (EmptyCell!6446) )
))
(declare-datatypes ((array!30892 0))(
  ( (array!30893 (arr!14853 (Array (_ BitVec 32) ValueCell!6446)) (size!15211 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!30892)

(declare-fun mapDefault!22117 () ValueCell!6446)

(assert (=> b!478960 (= condMapEmpty!22117 (= (arr!14853 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6446)) mapDefault!22117)))))

(declare-fun b!478961 () Bool)

(declare-fun e!281723 () Bool)

(assert (=> b!478961 (= e!281723 tp_is_empty!13615)))

(declare-fun b!478962 () Bool)

(declare-fun res!285752 () Bool)

(declare-fun e!281720 () Bool)

(assert (=> b!478962 (=> (not res!285752) (not e!281720))))

(declare-datatypes ((array!30894 0))(
  ( (array!30895 (arr!14854 (Array (_ BitVec 32) (_ BitVec 64))) (size!15212 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!30894)

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30894 (_ BitVec 32)) Bool)

(assert (=> b!478962 (= res!285752 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun res!285750 () Bool)

(assert (=> start!43212 (=> (not res!285750) (not e!281720))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43212 (= res!285750 (validMask!0 mask!2352))))

(assert (=> start!43212 e!281720))

(assert (=> start!43212 true))

(declare-fun array_inv!10794 (array!30892) Bool)

(assert (=> start!43212 (and (array_inv!10794 _values!1516) e!281721)))

(declare-fun array_inv!10795 (array!30894) Bool)

(assert (=> start!43212 (array_inv!10795 _keys!1874)))

(declare-fun mapIsEmpty!22117 () Bool)

(assert (=> mapIsEmpty!22117 mapRes!22117))

(declare-fun b!478963 () Bool)

(declare-fun res!285751 () Bool)

(assert (=> b!478963 (=> (not res!285751) (not e!281720))))

(declare-fun extraKeys!1437 () (_ BitVec 32))

(assert (=> b!478963 (= res!285751 (and (= (size!15211 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15212 _keys!1874) (size!15211 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun b!478964 () Bool)

(assert (=> b!478964 (= e!281720 false)))

(declare-fun lt!217819 () Bool)

(declare-datatypes ((List!8989 0))(
  ( (Nil!8986) (Cons!8985 (h!9841 (_ BitVec 64)) (t!15187 List!8989)) )
))
(declare-fun arrayNoDuplicates!0 (array!30894 (_ BitVec 32) List!8989) Bool)

(assert (=> b!478964 (= lt!217819 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!8986))))

(declare-fun mapNonEmpty!22117 () Bool)

(declare-fun tp!42592 () Bool)

(assert (=> mapNonEmpty!22117 (= mapRes!22117 (and tp!42592 e!281723))))

(declare-fun mapKey!22117 () (_ BitVec 32))

(declare-fun mapValue!22117 () ValueCell!6446)

(declare-fun mapRest!22117 () (Array (_ BitVec 32) ValueCell!6446))

(assert (=> mapNonEmpty!22117 (= (arr!14853 _values!1516) (store mapRest!22117 mapKey!22117 mapValue!22117))))

(assert (= (and start!43212 res!285750) b!478963))

(assert (= (and b!478963 res!285751) b!478962))

(assert (= (and b!478962 res!285752) b!478964))

(assert (= (and b!478960 condMapEmpty!22117) mapIsEmpty!22117))

(assert (= (and b!478960 (not condMapEmpty!22117)) mapNonEmpty!22117))

(get-info :version)

(assert (= (and mapNonEmpty!22117 ((_ is ValueCellFull!6446) mapValue!22117)) b!478961))

(assert (= (and b!478960 ((_ is ValueCellFull!6446) mapDefault!22117)) b!478959))

(assert (= start!43212 b!478960))

(declare-fun m!461275 () Bool)

(assert (=> b!478962 m!461275))

(declare-fun m!461277 () Bool)

(assert (=> start!43212 m!461277))

(declare-fun m!461279 () Bool)

(assert (=> start!43212 m!461279))

(declare-fun m!461281 () Bool)

(assert (=> start!43212 m!461281))

(declare-fun m!461283 () Bool)

(assert (=> b!478964 m!461283))

(declare-fun m!461285 () Bool)

(assert (=> mapNonEmpty!22117 m!461285))

(check-sat (not b!478962) tp_is_empty!13615 (not mapNonEmpty!22117) (not start!43212) (not b!478964))
(check-sat)

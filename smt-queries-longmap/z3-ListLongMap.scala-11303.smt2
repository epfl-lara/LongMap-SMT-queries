; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132134 () Bool)

(assert start!132134)

(declare-fun b!1544889 () Bool)

(declare-fun e!859649 () Bool)

(declare-fun tp_is_empty!37711 () Bool)

(assert (=> b!1544889 (= e!859649 tp_is_empty!37711)))

(declare-fun mapIsEmpty!58270 () Bool)

(declare-fun mapRes!58270 () Bool)

(assert (=> mapIsEmpty!58270 mapRes!58270))

(declare-fun b!1544890 () Bool)

(declare-fun e!859650 () Bool)

(assert (=> b!1544890 (= e!859650 (and e!859649 mapRes!58270))))

(declare-fun condMapEmpty!58270 () Bool)

(declare-datatypes ((V!58725 0))(
  ( (V!58726 (val!18933 Int)) )
))
(declare-datatypes ((ValueCell!17945 0))(
  ( (ValueCellFull!17945 (v!21726 V!58725)) (EmptyCell!17945) )
))
(declare-datatypes ((array!102776 0))(
  ( (array!102777 (arr!49583 (Array (_ BitVec 32) ValueCell!17945)) (size!50134 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102776)

(declare-fun mapDefault!58270 () ValueCell!17945)

(assert (=> b!1544890 (= condMapEmpty!58270 (= (arr!49583 _values!470) ((as const (Array (_ BitVec 32) ValueCell!17945)) mapDefault!58270)))))

(declare-fun res!1059362 () Bool)

(declare-fun e!859652 () Bool)

(assert (=> start!132134 (=> (not res!1059362) (not e!859652))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132134 (= res!1059362 (validMask!0 mask!926))))

(assert (=> start!132134 e!859652))

(assert (=> start!132134 true))

(declare-fun array_inv!38835 (array!102776) Bool)

(assert (=> start!132134 (and (array_inv!38835 _values!470) e!859650)))

(declare-datatypes ((array!102778 0))(
  ( (array!102779 (arr!49584 (Array (_ BitVec 32) (_ BitVec 64))) (size!50135 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102778)

(declare-fun array_inv!38836 (array!102778) Bool)

(assert (=> start!132134 (array_inv!38836 _keys!618)))

(declare-fun b!1544891 () Bool)

(declare-fun res!1059360 () Bool)

(assert (=> b!1544891 (=> (not res!1059360) (not e!859652))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1544891 (= res!1059360 (and (= (size!50134 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50135 _keys!618) (size!50134 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1544892 () Bool)

(declare-fun res!1059361 () Bool)

(assert (=> b!1544892 (=> (not res!1059361) (not e!859652))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102778 (_ BitVec 32)) Bool)

(assert (=> b!1544892 (= res!1059361 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1544893 () Bool)

(assert (=> b!1544893 (= e!859652 false)))

(declare-fun lt!666727 () Bool)

(declare-datatypes ((List!35918 0))(
  ( (Nil!35915) (Cons!35914 (h!37377 (_ BitVec 64)) (t!50604 List!35918)) )
))
(declare-fun arrayNoDuplicates!0 (array!102778 (_ BitVec 32) List!35918) Bool)

(assert (=> b!1544893 (= lt!666727 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35915))))

(declare-fun mapNonEmpty!58270 () Bool)

(declare-fun tp!110797 () Bool)

(declare-fun e!859653 () Bool)

(assert (=> mapNonEmpty!58270 (= mapRes!58270 (and tp!110797 e!859653))))

(declare-fun mapKey!58270 () (_ BitVec 32))

(declare-fun mapValue!58270 () ValueCell!17945)

(declare-fun mapRest!58270 () (Array (_ BitVec 32) ValueCell!17945))

(assert (=> mapNonEmpty!58270 (= (arr!49583 _values!470) (store mapRest!58270 mapKey!58270 mapValue!58270))))

(declare-fun b!1544894 () Bool)

(assert (=> b!1544894 (= e!859653 tp_is_empty!37711)))

(assert (= (and start!132134 res!1059362) b!1544891))

(assert (= (and b!1544891 res!1059360) b!1544892))

(assert (= (and b!1544892 res!1059361) b!1544893))

(assert (= (and b!1544890 condMapEmpty!58270) mapIsEmpty!58270))

(assert (= (and b!1544890 (not condMapEmpty!58270)) mapNonEmpty!58270))

(get-info :version)

(assert (= (and mapNonEmpty!58270 ((_ is ValueCellFull!17945) mapValue!58270)) b!1544894))

(assert (= (and b!1544890 ((_ is ValueCellFull!17945) mapDefault!58270)) b!1544889))

(assert (= start!132134 b!1544890))

(declare-fun m!1426347 () Bool)

(assert (=> start!132134 m!1426347))

(declare-fun m!1426349 () Bool)

(assert (=> start!132134 m!1426349))

(declare-fun m!1426351 () Bool)

(assert (=> start!132134 m!1426351))

(declare-fun m!1426353 () Bool)

(assert (=> b!1544892 m!1426353))

(declare-fun m!1426355 () Bool)

(assert (=> b!1544893 m!1426355))

(declare-fun m!1426357 () Bool)

(assert (=> mapNonEmpty!58270 m!1426357))

(check-sat (not b!1544892) (not mapNonEmpty!58270) (not b!1544893) (not start!132134) tp_is_empty!37711)
(check-sat)

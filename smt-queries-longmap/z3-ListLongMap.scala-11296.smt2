; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132092 () Bool)

(assert start!132092)

(declare-fun mapNonEmpty!58207 () Bool)

(declare-fun mapRes!58207 () Bool)

(declare-fun tp!110734 () Bool)

(declare-fun e!859338 () Bool)

(assert (=> mapNonEmpty!58207 (= mapRes!58207 (and tp!110734 e!859338))))

(declare-datatypes ((V!58669 0))(
  ( (V!58670 (val!18912 Int)) )
))
(declare-datatypes ((ValueCell!17924 0))(
  ( (ValueCellFull!17924 (v!21705 V!58669)) (EmptyCell!17924) )
))
(declare-fun mapValue!58207 () ValueCell!17924)

(declare-fun mapRest!58207 () (Array (_ BitVec 32) ValueCell!17924))

(declare-datatypes ((array!102698 0))(
  ( (array!102699 (arr!49544 (Array (_ BitVec 32) ValueCell!17924)) (size!50095 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102698)

(declare-fun mapKey!58207 () (_ BitVec 32))

(assert (=> mapNonEmpty!58207 (= (arr!49544 _values!470) (store mapRest!58207 mapKey!58207 mapValue!58207))))

(declare-fun mapIsEmpty!58207 () Bool)

(assert (=> mapIsEmpty!58207 mapRes!58207))

(declare-fun b!1544511 () Bool)

(declare-fun res!1059173 () Bool)

(declare-fun e!859334 () Bool)

(assert (=> b!1544511 (=> (not res!1059173) (not e!859334))))

(declare-datatypes ((array!102700 0))(
  ( (array!102701 (arr!49545 (Array (_ BitVec 32) (_ BitVec 64))) (size!50096 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102700)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun mask!926 () (_ BitVec 32))

(assert (=> b!1544511 (= res!1059173 (and (= (size!50095 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50096 _keys!618) (size!50095 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1544512 () Bool)

(assert (=> b!1544512 (= e!859334 false)))

(declare-fun lt!666664 () Bool)

(declare-datatypes ((List!35904 0))(
  ( (Nil!35901) (Cons!35900 (h!37363 (_ BitVec 64)) (t!50590 List!35904)) )
))
(declare-fun arrayNoDuplicates!0 (array!102700 (_ BitVec 32) List!35904) Bool)

(assert (=> b!1544512 (= lt!666664 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35901))))

(declare-fun b!1544513 () Bool)

(declare-fun e!859335 () Bool)

(declare-fun e!859337 () Bool)

(assert (=> b!1544513 (= e!859335 (and e!859337 mapRes!58207))))

(declare-fun condMapEmpty!58207 () Bool)

(declare-fun mapDefault!58207 () ValueCell!17924)

(assert (=> b!1544513 (= condMapEmpty!58207 (= (arr!49544 _values!470) ((as const (Array (_ BitVec 32) ValueCell!17924)) mapDefault!58207)))))

(declare-fun b!1544514 () Bool)

(declare-fun tp_is_empty!37669 () Bool)

(assert (=> b!1544514 (= e!859337 tp_is_empty!37669)))

(declare-fun res!1059172 () Bool)

(assert (=> start!132092 (=> (not res!1059172) (not e!859334))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132092 (= res!1059172 (validMask!0 mask!926))))

(assert (=> start!132092 e!859334))

(assert (=> start!132092 true))

(declare-fun array_inv!38811 (array!102698) Bool)

(assert (=> start!132092 (and (array_inv!38811 _values!470) e!859335)))

(declare-fun array_inv!38812 (array!102700) Bool)

(assert (=> start!132092 (array_inv!38812 _keys!618)))

(declare-fun b!1544515 () Bool)

(declare-fun res!1059171 () Bool)

(assert (=> b!1544515 (=> (not res!1059171) (not e!859334))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102700 (_ BitVec 32)) Bool)

(assert (=> b!1544515 (= res!1059171 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1544516 () Bool)

(assert (=> b!1544516 (= e!859338 tp_is_empty!37669)))

(assert (= (and start!132092 res!1059172) b!1544511))

(assert (= (and b!1544511 res!1059173) b!1544515))

(assert (= (and b!1544515 res!1059171) b!1544512))

(assert (= (and b!1544513 condMapEmpty!58207) mapIsEmpty!58207))

(assert (= (and b!1544513 (not condMapEmpty!58207)) mapNonEmpty!58207))

(get-info :version)

(assert (= (and mapNonEmpty!58207 ((_ is ValueCellFull!17924) mapValue!58207)) b!1544516))

(assert (= (and b!1544513 ((_ is ValueCellFull!17924) mapDefault!58207)) b!1544514))

(assert (= start!132092 b!1544513))

(declare-fun m!1426095 () Bool)

(assert (=> mapNonEmpty!58207 m!1426095))

(declare-fun m!1426097 () Bool)

(assert (=> b!1544512 m!1426097))

(declare-fun m!1426099 () Bool)

(assert (=> start!132092 m!1426099))

(declare-fun m!1426101 () Bool)

(assert (=> start!132092 m!1426101))

(declare-fun m!1426103 () Bool)

(assert (=> start!132092 m!1426103))

(declare-fun m!1426105 () Bool)

(assert (=> b!1544515 m!1426105))

(check-sat (not b!1544515) tp_is_empty!37669 (not mapNonEmpty!58207) (not b!1544512) (not start!132092))
(check-sat)

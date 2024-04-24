; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20104 () Bool)

(assert start!20104)

(declare-fun b_free!4759 () Bool)

(declare-fun b_next!4759 () Bool)

(assert (=> start!20104 (= b_free!4759 (not b_next!4759))))

(declare-fun tp!17308 () Bool)

(declare-fun b_and!11519 () Bool)

(assert (=> start!20104 (= tp!17308 b_and!11519)))

(declare-fun b!196981 () Bool)

(declare-fun res!93060 () Bool)

(declare-fun e!129698 () Bool)

(assert (=> b!196981 (=> (not res!93060) (not e!129698))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((array!8475 0))(
  ( (array!8476 (arr!3988 (Array (_ BitVec 32) (_ BitVec 64))) (size!4313 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8475)

(assert (=> b!196981 (= res!93060 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4313 _keys!825))))))

(declare-fun b!196982 () Bool)

(declare-fun res!93059 () Bool)

(assert (=> b!196982 (=> (not res!93059) (not e!129698))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((V!5801 0))(
  ( (V!5802 (val!2352 Int)) )
))
(declare-datatypes ((ValueCell!1964 0))(
  ( (ValueCellFull!1964 (v!4323 V!5801)) (EmptyCell!1964) )
))
(declare-datatypes ((array!8477 0))(
  ( (array!8478 (arr!3989 (Array (_ BitVec 32) ValueCell!1964)) (size!4314 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8477)

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!196982 (= res!93059 (and (= (size!4314 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4313 _keys!825) (size!4314 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!196983 () Bool)

(declare-fun res!93056 () Bool)

(assert (=> b!196983 (=> (not res!93056) (not e!129698))))

(declare-fun k0!843 () (_ BitVec 64))

(assert (=> b!196983 (= res!93056 (= (select (arr!3988 _keys!825) i!601) k0!843))))

(declare-fun mapNonEmpty!7991 () Bool)

(declare-fun mapRes!7991 () Bool)

(declare-fun tp!17309 () Bool)

(declare-fun e!129695 () Bool)

(assert (=> mapNonEmpty!7991 (= mapRes!7991 (and tp!17309 e!129695))))

(declare-fun mapKey!7991 () (_ BitVec 32))

(declare-fun mapValue!7991 () ValueCell!1964)

(declare-fun mapRest!7991 () (Array (_ BitVec 32) ValueCell!1964))

(assert (=> mapNonEmpty!7991 (= (arr!3989 _values!649) (store mapRest!7991 mapKey!7991 mapValue!7991))))

(declare-fun b!196984 () Bool)

(declare-fun res!93057 () Bool)

(assert (=> b!196984 (=> (not res!93057) (not e!129698))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!196984 (= res!93057 (validKeyInArray!0 k0!843))))

(declare-fun b!196985 () Bool)

(declare-fun res!93058 () Bool)

(assert (=> b!196985 (=> (not res!93058) (not e!129698))))

(declare-datatypes ((List!2446 0))(
  ( (Nil!2443) (Cons!2442 (h!3084 (_ BitVec 64)) (t!7369 List!2446)) )
))
(declare-fun arrayNoDuplicates!0 (array!8475 (_ BitVec 32) List!2446) Bool)

(assert (=> b!196985 (= res!93058 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2443))))

(declare-fun b!196986 () Bool)

(declare-fun tp_is_empty!4615 () Bool)

(assert (=> b!196986 (= e!129695 tp_is_empty!4615)))

(declare-fun res!93061 () Bool)

(assert (=> start!20104 (=> (not res!93061) (not e!129698))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20104 (= res!93061 (validMask!0 mask!1149))))

(assert (=> start!20104 e!129698))

(declare-fun e!129696 () Bool)

(declare-fun array_inv!2593 (array!8477) Bool)

(assert (=> start!20104 (and (array_inv!2593 _values!649) e!129696)))

(assert (=> start!20104 true))

(assert (=> start!20104 tp_is_empty!4615))

(declare-fun array_inv!2594 (array!8475) Bool)

(assert (=> start!20104 (array_inv!2594 _keys!825)))

(assert (=> start!20104 tp!17308))

(declare-fun mapIsEmpty!7991 () Bool)

(assert (=> mapIsEmpty!7991 mapRes!7991))

(declare-fun b!196987 () Bool)

(declare-fun res!93055 () Bool)

(assert (=> b!196987 (=> (not res!93055) (not e!129698))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8475 (_ BitVec 32)) Bool)

(assert (=> b!196987 (= res!93055 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!196988 () Bool)

(assert (=> b!196988 (= e!129698 false)))

(declare-datatypes ((tuple2!3526 0))(
  ( (tuple2!3527 (_1!1774 (_ BitVec 64)) (_2!1774 V!5801)) )
))
(declare-datatypes ((List!2447 0))(
  ( (Nil!2444) (Cons!2443 (h!3085 tuple2!3526) (t!7370 List!2447)) )
))
(declare-datatypes ((ListLongMap!2441 0))(
  ( (ListLongMap!2442 (toList!1236 List!2447)) )
))
(declare-fun lt!97727 () ListLongMap!2441)

(declare-fun zeroValue!615 () V!5801)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!5801)

(declare-fun getCurrentListMapNoExtraKeys!226 (array!8475 array!8477 (_ BitVec 32) (_ BitVec 32) V!5801 V!5801 (_ BitVec 32) Int) ListLongMap!2441)

(assert (=> b!196988 (= lt!97727 (getCurrentListMapNoExtraKeys!226 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!196989 () Bool)

(declare-fun e!129694 () Bool)

(assert (=> b!196989 (= e!129696 (and e!129694 mapRes!7991))))

(declare-fun condMapEmpty!7991 () Bool)

(declare-fun mapDefault!7991 () ValueCell!1964)

(assert (=> b!196989 (= condMapEmpty!7991 (= (arr!3989 _values!649) ((as const (Array (_ BitVec 32) ValueCell!1964)) mapDefault!7991)))))

(declare-fun b!196990 () Bool)

(assert (=> b!196990 (= e!129694 tp_is_empty!4615)))

(assert (= (and start!20104 res!93061) b!196982))

(assert (= (and b!196982 res!93059) b!196987))

(assert (= (and b!196987 res!93055) b!196985))

(assert (= (and b!196985 res!93058) b!196981))

(assert (= (and b!196981 res!93060) b!196984))

(assert (= (and b!196984 res!93057) b!196983))

(assert (= (and b!196983 res!93056) b!196988))

(assert (= (and b!196989 condMapEmpty!7991) mapIsEmpty!7991))

(assert (= (and b!196989 (not condMapEmpty!7991)) mapNonEmpty!7991))

(get-info :version)

(assert (= (and mapNonEmpty!7991 ((_ is ValueCellFull!1964) mapValue!7991)) b!196986))

(assert (= (and b!196989 ((_ is ValueCellFull!1964) mapDefault!7991)) b!196990))

(assert (= start!20104 b!196989))

(declare-fun m!224199 () Bool)

(assert (=> b!196987 m!224199))

(declare-fun m!224201 () Bool)

(assert (=> b!196984 m!224201))

(declare-fun m!224203 () Bool)

(assert (=> mapNonEmpty!7991 m!224203))

(declare-fun m!224205 () Bool)

(assert (=> start!20104 m!224205))

(declare-fun m!224207 () Bool)

(assert (=> start!20104 m!224207))

(declare-fun m!224209 () Bool)

(assert (=> start!20104 m!224209))

(declare-fun m!224211 () Bool)

(assert (=> b!196983 m!224211))

(declare-fun m!224213 () Bool)

(assert (=> b!196985 m!224213))

(declare-fun m!224215 () Bool)

(assert (=> b!196988 m!224215))

(check-sat (not mapNonEmpty!7991) (not b!196988) (not b_next!4759) tp_is_empty!4615 (not start!20104) (not b!196984) (not b!196987) b_and!11519 (not b!196985))
(check-sat b_and!11519 (not b_next!4759))

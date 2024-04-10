; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20120 () Bool)

(assert start!20120)

(declare-fun b_free!4779 () Bool)

(declare-fun b_next!4779 () Bool)

(assert (=> start!20120 (= b_free!4779 (not b_next!4779))))

(declare-fun tp!17368 () Bool)

(declare-fun b_and!11525 () Bool)

(assert (=> start!20120 (= tp!17368 b_and!11525)))

(declare-fun b!197234 () Bool)

(declare-fun e!129821 () Bool)

(declare-fun tp_is_empty!4635 () Bool)

(assert (=> b!197234 (= e!129821 tp_is_empty!4635)))

(declare-fun b!197236 () Bool)

(declare-fun res!93249 () Bool)

(declare-fun e!129820 () Bool)

(assert (=> b!197236 (=> (not res!93249) (not e!129820))))

(declare-datatypes ((array!8523 0))(
  ( (array!8524 (arr!4012 (Array (_ BitVec 32) (_ BitVec 64))) (size!4337 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8523)

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!197236 (= res!93249 (= (select (arr!4012 _keys!825) i!601) k0!843))))

(declare-fun b!197237 () Bool)

(declare-fun res!93245 () Bool)

(assert (=> b!197237 (=> (not res!93245) (not e!129820))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8523 (_ BitVec 32)) Bool)

(assert (=> b!197237 (= res!93245 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!197238 () Bool)

(declare-fun e!129822 () Bool)

(declare-fun mapRes!8021 () Bool)

(assert (=> b!197238 (= e!129822 (and e!129821 mapRes!8021))))

(declare-fun condMapEmpty!8021 () Bool)

(declare-datatypes ((V!5827 0))(
  ( (V!5828 (val!2362 Int)) )
))
(declare-datatypes ((ValueCell!1974 0))(
  ( (ValueCellFull!1974 (v!4332 V!5827)) (EmptyCell!1974) )
))
(declare-datatypes ((array!8525 0))(
  ( (array!8526 (arr!4013 (Array (_ BitVec 32) ValueCell!1974)) (size!4338 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8525)

(declare-fun mapDefault!8021 () ValueCell!1974)

(assert (=> b!197238 (= condMapEmpty!8021 (= (arr!4013 _values!649) ((as const (Array (_ BitVec 32) ValueCell!1974)) mapDefault!8021)))))

(declare-fun b!197239 () Bool)

(declare-fun res!93247 () Bool)

(assert (=> b!197239 (=> (not res!93247) (not e!129820))))

(declare-datatypes ((List!2504 0))(
  ( (Nil!2501) (Cons!2500 (h!3142 (_ BitVec 64)) (t!7435 List!2504)) )
))
(declare-fun arrayNoDuplicates!0 (array!8523 (_ BitVec 32) List!2504) Bool)

(assert (=> b!197239 (= res!93247 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2501))))

(declare-fun mapIsEmpty!8021 () Bool)

(assert (=> mapIsEmpty!8021 mapRes!8021))

(declare-fun mapNonEmpty!8021 () Bool)

(declare-fun tp!17369 () Bool)

(declare-fun e!129823 () Bool)

(assert (=> mapNonEmpty!8021 (= mapRes!8021 (and tp!17369 e!129823))))

(declare-fun mapRest!8021 () (Array (_ BitVec 32) ValueCell!1974))

(declare-fun mapValue!8021 () ValueCell!1974)

(declare-fun mapKey!8021 () (_ BitVec 32))

(assert (=> mapNonEmpty!8021 (= (arr!4013 _values!649) (store mapRest!8021 mapKey!8021 mapValue!8021))))

(declare-fun b!197240 () Bool)

(declare-fun res!93248 () Bool)

(assert (=> b!197240 (=> (not res!93248) (not e!129820))))

(assert (=> b!197240 (= res!93248 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4337 _keys!825))))))

(declare-fun b!197241 () Bool)

(declare-fun res!93244 () Bool)

(assert (=> b!197241 (=> (not res!93244) (not e!129820))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!197241 (= res!93244 (validKeyInArray!0 k0!843))))

(declare-fun res!93246 () Bool)

(assert (=> start!20120 (=> (not res!93246) (not e!129820))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20120 (= res!93246 (validMask!0 mask!1149))))

(assert (=> start!20120 e!129820))

(declare-fun array_inv!2619 (array!8525) Bool)

(assert (=> start!20120 (and (array_inv!2619 _values!649) e!129822)))

(assert (=> start!20120 true))

(assert (=> start!20120 tp_is_empty!4635))

(declare-fun array_inv!2620 (array!8523) Bool)

(assert (=> start!20120 (array_inv!2620 _keys!825)))

(assert (=> start!20120 tp!17368))

(declare-fun b!197235 () Bool)

(assert (=> b!197235 (= e!129823 tp_is_empty!4635)))

(declare-fun b!197242 () Bool)

(declare-fun res!93250 () Bool)

(assert (=> b!197242 (=> (not res!93250) (not e!129820))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!197242 (= res!93250 (and (= (size!4338 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4337 _keys!825) (size!4338 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!197243 () Bool)

(assert (=> b!197243 (= e!129820 false)))

(declare-datatypes ((tuple2!3592 0))(
  ( (tuple2!3593 (_1!1807 (_ BitVec 64)) (_2!1807 V!5827)) )
))
(declare-datatypes ((List!2505 0))(
  ( (Nil!2502) (Cons!2501 (h!3143 tuple2!3592) (t!7436 List!2505)) )
))
(declare-datatypes ((ListLongMap!2505 0))(
  ( (ListLongMap!2506 (toList!1268 List!2505)) )
))
(declare-fun lt!97698 () ListLongMap!2505)

(declare-fun zeroValue!615 () V!5827)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!5827)

(declare-fun getCurrentListMapNoExtraKeys!233 (array!8523 array!8525 (_ BitVec 32) (_ BitVec 32) V!5827 V!5827 (_ BitVec 32) Int) ListLongMap!2505)

(assert (=> b!197243 (= lt!97698 (getCurrentListMapNoExtraKeys!233 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (= (and start!20120 res!93246) b!197242))

(assert (= (and b!197242 res!93250) b!197237))

(assert (= (and b!197237 res!93245) b!197239))

(assert (= (and b!197239 res!93247) b!197240))

(assert (= (and b!197240 res!93248) b!197241))

(assert (= (and b!197241 res!93244) b!197236))

(assert (= (and b!197236 res!93249) b!197243))

(assert (= (and b!197238 condMapEmpty!8021) mapIsEmpty!8021))

(assert (= (and b!197238 (not condMapEmpty!8021)) mapNonEmpty!8021))

(get-info :version)

(assert (= (and mapNonEmpty!8021 ((_ is ValueCellFull!1974) mapValue!8021)) b!197235))

(assert (= (and b!197238 ((_ is ValueCellFull!1974) mapDefault!8021)) b!197234))

(assert (= start!20120 b!197238))

(declare-fun m!224197 () Bool)

(assert (=> start!20120 m!224197))

(declare-fun m!224199 () Bool)

(assert (=> start!20120 m!224199))

(declare-fun m!224201 () Bool)

(assert (=> start!20120 m!224201))

(declare-fun m!224203 () Bool)

(assert (=> b!197236 m!224203))

(declare-fun m!224205 () Bool)

(assert (=> b!197241 m!224205))

(declare-fun m!224207 () Bool)

(assert (=> b!197243 m!224207))

(declare-fun m!224209 () Bool)

(assert (=> b!197237 m!224209))

(declare-fun m!224211 () Bool)

(assert (=> b!197239 m!224211))

(declare-fun m!224213 () Bool)

(assert (=> mapNonEmpty!8021 m!224213))

(check-sat (not b!197239) (not start!20120) (not b_next!4779) (not b!197241) b_and!11525 (not b!197243) tp_is_empty!4635 (not b!197237) (not mapNonEmpty!8021))
(check-sat b_and!11525 (not b_next!4779))

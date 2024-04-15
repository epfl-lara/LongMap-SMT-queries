; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20134 () Bool)

(assert start!20134)

(declare-fun b_free!4789 () Bool)

(declare-fun b_next!4789 () Bool)

(assert (=> start!20134 (= b_free!4789 (not b_next!4789))))

(declare-fun tp!17399 () Bool)

(declare-fun b_and!11509 () Bool)

(assert (=> start!20134 (= tp!17399 b_and!11509)))

(declare-fun mapIsEmpty!8036 () Bool)

(declare-fun mapRes!8036 () Bool)

(assert (=> mapIsEmpty!8036 mapRes!8036))

(declare-fun b!197237 () Bool)

(declare-fun e!129796 () Bool)

(declare-fun tp_is_empty!4645 () Bool)

(assert (=> b!197237 (= e!129796 tp_is_empty!4645)))

(declare-fun b!197238 () Bool)

(declare-fun res!93256 () Bool)

(declare-fun e!129795 () Bool)

(assert (=> b!197238 (=> (not res!93256) (not e!129795))))

(declare-datatypes ((array!8521 0))(
  ( (array!8522 (arr!4010 (Array (_ BitVec 32) (_ BitVec 64))) (size!4336 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8521)

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!197238 (= res!93256 (= (select (arr!4010 _keys!825) i!601) k0!843))))

(declare-fun mapNonEmpty!8036 () Bool)

(declare-fun tp!17398 () Bool)

(assert (=> mapNonEmpty!8036 (= mapRes!8036 (and tp!17398 e!129796))))

(declare-datatypes ((V!5841 0))(
  ( (V!5842 (val!2367 Int)) )
))
(declare-datatypes ((ValueCell!1979 0))(
  ( (ValueCellFull!1979 (v!4331 V!5841)) (EmptyCell!1979) )
))
(declare-fun mapValue!8036 () ValueCell!1979)

(declare-fun mapKey!8036 () (_ BitVec 32))

(declare-datatypes ((array!8523 0))(
  ( (array!8524 (arr!4011 (Array (_ BitVec 32) ValueCell!1979)) (size!4337 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8523)

(declare-fun mapRest!8036 () (Array (_ BitVec 32) ValueCell!1979))

(assert (=> mapNonEmpty!8036 (= (arr!4011 _values!649) (store mapRest!8036 mapKey!8036 mapValue!8036))))

(declare-fun b!197240 () Bool)

(assert (=> b!197240 (= e!129795 (bvsgt #b00000000000000000000000000000000 (size!4336 _keys!825)))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun zeroValue!615 () V!5841)

(declare-datatypes ((tuple2!3560 0))(
  ( (tuple2!3561 (_1!1791 (_ BitVec 64)) (_2!1791 V!5841)) )
))
(declare-datatypes ((List!2492 0))(
  ( (Nil!2489) (Cons!2488 (h!3130 tuple2!3560) (t!7414 List!2492)) )
))
(declare-datatypes ((ListLongMap!2463 0))(
  ( (ListLongMap!2464 (toList!1247 List!2492)) )
))
(declare-fun lt!97532 () ListLongMap!2463)

(declare-fun defaultEntry!657 () Int)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!5841)

(declare-fun getCurrentListMapNoExtraKeys!227 (array!8521 array!8523 (_ BitVec 32) (_ BitVec 32) V!5841 V!5841 (_ BitVec 32) Int) ListLongMap!2463)

(assert (=> b!197240 (= lt!97532 (getCurrentListMapNoExtraKeys!227 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!197241 () Bool)

(declare-fun res!93260 () Bool)

(assert (=> b!197241 (=> (not res!93260) (not e!129795))))

(declare-datatypes ((List!2493 0))(
  ( (Nil!2490) (Cons!2489 (h!3131 (_ BitVec 64)) (t!7415 List!2493)) )
))
(declare-fun arrayNoDuplicates!0 (array!8521 (_ BitVec 32) List!2493) Bool)

(assert (=> b!197241 (= res!93260 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2490))))

(declare-fun b!197242 () Bool)

(declare-fun res!93258 () Bool)

(assert (=> b!197242 (=> (not res!93258) (not e!129795))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8521 (_ BitVec 32)) Bool)

(assert (=> b!197242 (= res!93258 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!197243 () Bool)

(declare-fun res!93255 () Bool)

(assert (=> b!197243 (=> (not res!93255) (not e!129795))))

(assert (=> b!197243 (= res!93255 (and (= (size!4337 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4336 _keys!825) (size!4337 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!197244 () Bool)

(declare-fun res!93254 () Bool)

(assert (=> b!197244 (=> (not res!93254) (not e!129795))))

(assert (=> b!197244 (= res!93254 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4336 _keys!825))))))

(declare-fun res!93257 () Bool)

(assert (=> start!20134 (=> (not res!93257) (not e!129795))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20134 (= res!93257 (validMask!0 mask!1149))))

(assert (=> start!20134 e!129795))

(declare-fun e!129798 () Bool)

(declare-fun array_inv!2607 (array!8523) Bool)

(assert (=> start!20134 (and (array_inv!2607 _values!649) e!129798)))

(assert (=> start!20134 true))

(assert (=> start!20134 tp_is_empty!4645))

(declare-fun array_inv!2608 (array!8521) Bool)

(assert (=> start!20134 (array_inv!2608 _keys!825)))

(assert (=> start!20134 tp!17399))

(declare-fun b!197239 () Bool)

(declare-fun res!93259 () Bool)

(assert (=> b!197239 (=> (not res!93259) (not e!129795))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!197239 (= res!93259 (validKeyInArray!0 k0!843))))

(declare-fun b!197245 () Bool)

(declare-fun e!129797 () Bool)

(assert (=> b!197245 (= e!129798 (and e!129797 mapRes!8036))))

(declare-fun condMapEmpty!8036 () Bool)

(declare-fun mapDefault!8036 () ValueCell!1979)

(assert (=> b!197245 (= condMapEmpty!8036 (= (arr!4011 _values!649) ((as const (Array (_ BitVec 32) ValueCell!1979)) mapDefault!8036)))))

(declare-fun b!197246 () Bool)

(assert (=> b!197246 (= e!129797 tp_is_empty!4645)))

(assert (= (and start!20134 res!93257) b!197243))

(assert (= (and b!197243 res!93255) b!197242))

(assert (= (and b!197242 res!93258) b!197241))

(assert (= (and b!197241 res!93260) b!197244))

(assert (= (and b!197244 res!93254) b!197239))

(assert (= (and b!197239 res!93259) b!197238))

(assert (= (and b!197238 res!93256) b!197240))

(assert (= (and b!197245 condMapEmpty!8036) mapIsEmpty!8036))

(assert (= (and b!197245 (not condMapEmpty!8036)) mapNonEmpty!8036))

(get-info :version)

(assert (= (and mapNonEmpty!8036 ((_ is ValueCellFull!1979) mapValue!8036)) b!197237))

(assert (= (and b!197245 ((_ is ValueCellFull!1979) mapDefault!8036)) b!197246))

(assert (= start!20134 b!197245))

(declare-fun m!223671 () Bool)

(assert (=> b!197239 m!223671))

(declare-fun m!223673 () Bool)

(assert (=> b!197242 m!223673))

(declare-fun m!223675 () Bool)

(assert (=> mapNonEmpty!8036 m!223675))

(declare-fun m!223677 () Bool)

(assert (=> start!20134 m!223677))

(declare-fun m!223679 () Bool)

(assert (=> start!20134 m!223679))

(declare-fun m!223681 () Bool)

(assert (=> start!20134 m!223681))

(declare-fun m!223683 () Bool)

(assert (=> b!197238 m!223683))

(declare-fun m!223685 () Bool)

(assert (=> b!197241 m!223685))

(declare-fun m!223687 () Bool)

(assert (=> b!197240 m!223687))

(check-sat (not b!197240) (not b!197239) (not b!197242) (not start!20134) (not b_next!4789) (not mapNonEmpty!8036) (not b!197241) b_and!11509 tp_is_empty!4645)
(check-sat b_and!11509 (not b_next!4789))

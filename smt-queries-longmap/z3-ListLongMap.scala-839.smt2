; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20134 () Bool)

(assert start!20134)

(declare-fun b_free!4789 () Bool)

(declare-fun b_next!4789 () Bool)

(assert (=> start!20134 (= b_free!4789 (not b_next!4789))))

(declare-fun tp!17398 () Bool)

(declare-fun b_and!11549 () Bool)

(assert (=> start!20134 (= tp!17398 b_and!11549)))

(declare-fun b!197431 () Bool)

(declare-fun e!129920 () Bool)

(declare-fun e!129923 () Bool)

(declare-fun mapRes!8036 () Bool)

(assert (=> b!197431 (= e!129920 (and e!129923 mapRes!8036))))

(declare-fun condMapEmpty!8036 () Bool)

(declare-datatypes ((V!5841 0))(
  ( (V!5842 (val!2367 Int)) )
))
(declare-datatypes ((ValueCell!1979 0))(
  ( (ValueCellFull!1979 (v!4338 V!5841)) (EmptyCell!1979) )
))
(declare-datatypes ((array!8535 0))(
  ( (array!8536 (arr!4018 (Array (_ BitVec 32) ValueCell!1979)) (size!4343 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8535)

(declare-fun mapDefault!8036 () ValueCell!1979)

(assert (=> b!197431 (= condMapEmpty!8036 (= (arr!4018 _values!649) ((as const (Array (_ BitVec 32) ValueCell!1979)) mapDefault!8036)))))

(declare-fun b!197432 () Bool)

(declare-fun e!129921 () Bool)

(declare-datatypes ((array!8537 0))(
  ( (array!8538 (arr!4019 (Array (_ BitVec 32) (_ BitVec 64))) (size!4344 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8537)

(assert (=> b!197432 (= e!129921 (bvsgt #b00000000000000000000000000000000 (size!4344 _keys!825)))))

(declare-datatypes ((tuple2!3548 0))(
  ( (tuple2!3549 (_1!1785 (_ BitVec 64)) (_2!1785 V!5841)) )
))
(declare-datatypes ((List!2465 0))(
  ( (Nil!2462) (Cons!2461 (h!3103 tuple2!3548) (t!7388 List!2465)) )
))
(declare-datatypes ((ListLongMap!2463 0))(
  ( (ListLongMap!2464 (toList!1247 List!2465)) )
))
(declare-fun lt!97772 () ListLongMap!2463)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun zeroValue!615 () V!5841)

(declare-fun defaultEntry!657 () Int)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!5841)

(declare-fun getCurrentListMapNoExtraKeys!237 (array!8537 array!8535 (_ BitVec 32) (_ BitVec 32) V!5841 V!5841 (_ BitVec 32) Int) ListLongMap!2463)

(assert (=> b!197432 (= lt!97772 (getCurrentListMapNoExtraKeys!237 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!197433 () Bool)

(declare-fun tp_is_empty!4645 () Bool)

(assert (=> b!197433 (= e!129923 tp_is_empty!4645)))

(declare-fun mapNonEmpty!8036 () Bool)

(declare-fun tp!17399 () Bool)

(declare-fun e!129919 () Bool)

(assert (=> mapNonEmpty!8036 (= mapRes!8036 (and tp!17399 e!129919))))

(declare-fun mapKey!8036 () (_ BitVec 32))

(declare-fun mapValue!8036 () ValueCell!1979)

(declare-fun mapRest!8036 () (Array (_ BitVec 32) ValueCell!1979))

(assert (=> mapNonEmpty!8036 (= (arr!4018 _values!649) (store mapRest!8036 mapKey!8036 mapValue!8036))))

(declare-fun b!197434 () Bool)

(declare-fun res!93375 () Bool)

(assert (=> b!197434 (=> (not res!93375) (not e!129921))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!197434 (= res!93375 (validKeyInArray!0 k0!843))))

(declare-fun b!197435 () Bool)

(declare-fun res!93371 () Bool)

(assert (=> b!197435 (=> (not res!93371) (not e!129921))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!197435 (= res!93371 (= (select (arr!4019 _keys!825) i!601) k0!843))))

(declare-fun res!93372 () Bool)

(assert (=> start!20134 (=> (not res!93372) (not e!129921))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20134 (= res!93372 (validMask!0 mask!1149))))

(assert (=> start!20134 e!129921))

(declare-fun array_inv!2615 (array!8535) Bool)

(assert (=> start!20134 (and (array_inv!2615 _values!649) e!129920)))

(assert (=> start!20134 true))

(assert (=> start!20134 tp_is_empty!4645))

(declare-fun array_inv!2616 (array!8537) Bool)

(assert (=> start!20134 (array_inv!2616 _keys!825)))

(assert (=> start!20134 tp!17398))

(declare-fun b!197436 () Bool)

(declare-fun res!93373 () Bool)

(assert (=> b!197436 (=> (not res!93373) (not e!129921))))

(assert (=> b!197436 (= res!93373 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4344 _keys!825))))))

(declare-fun b!197437 () Bool)

(declare-fun res!93370 () Bool)

(assert (=> b!197437 (=> (not res!93370) (not e!129921))))

(declare-datatypes ((List!2466 0))(
  ( (Nil!2463) (Cons!2462 (h!3104 (_ BitVec 64)) (t!7389 List!2466)) )
))
(declare-fun arrayNoDuplicates!0 (array!8537 (_ BitVec 32) List!2466) Bool)

(assert (=> b!197437 (= res!93370 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2463))))

(declare-fun mapIsEmpty!8036 () Bool)

(assert (=> mapIsEmpty!8036 mapRes!8036))

(declare-fun b!197438 () Bool)

(assert (=> b!197438 (= e!129919 tp_is_empty!4645)))

(declare-fun b!197439 () Bool)

(declare-fun res!93376 () Bool)

(assert (=> b!197439 (=> (not res!93376) (not e!129921))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8537 (_ BitVec 32)) Bool)

(assert (=> b!197439 (= res!93376 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!197440 () Bool)

(declare-fun res!93374 () Bool)

(assert (=> b!197440 (=> (not res!93374) (not e!129921))))

(assert (=> b!197440 (= res!93374 (and (= (size!4343 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4344 _keys!825) (size!4343 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(assert (= (and start!20134 res!93372) b!197440))

(assert (= (and b!197440 res!93374) b!197439))

(assert (= (and b!197439 res!93376) b!197437))

(assert (= (and b!197437 res!93370) b!197436))

(assert (= (and b!197436 res!93373) b!197434))

(assert (= (and b!197434 res!93375) b!197435))

(assert (= (and b!197435 res!93371) b!197432))

(assert (= (and b!197431 condMapEmpty!8036) mapIsEmpty!8036))

(assert (= (and b!197431 (not condMapEmpty!8036)) mapNonEmpty!8036))

(get-info :version)

(assert (= (and mapNonEmpty!8036 ((_ is ValueCellFull!1979) mapValue!8036)) b!197438))

(assert (= (and b!197431 ((_ is ValueCellFull!1979) mapDefault!8036)) b!197433))

(assert (= start!20134 b!197431))

(declare-fun m!224469 () Bool)

(assert (=> start!20134 m!224469))

(declare-fun m!224471 () Bool)

(assert (=> start!20134 m!224471))

(declare-fun m!224473 () Bool)

(assert (=> start!20134 m!224473))

(declare-fun m!224475 () Bool)

(assert (=> b!197434 m!224475))

(declare-fun m!224477 () Bool)

(assert (=> b!197437 m!224477))

(declare-fun m!224479 () Bool)

(assert (=> b!197439 m!224479))

(declare-fun m!224481 () Bool)

(assert (=> b!197435 m!224481))

(declare-fun m!224483 () Bool)

(assert (=> mapNonEmpty!8036 m!224483))

(declare-fun m!224485 () Bool)

(assert (=> b!197432 m!224485))

(check-sat tp_is_empty!4645 (not start!20134) (not mapNonEmpty!8036) b_and!11549 (not b_next!4789) (not b!197437) (not b!197434) (not b!197432) (not b!197439))
(check-sat b_and!11549 (not b_next!4789))

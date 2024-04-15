; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20806 () Bool)

(assert start!20806)

(declare-fun b_free!5455 () Bool)

(declare-fun b_next!5455 () Bool)

(assert (=> start!20806 (= b_free!5455 (not b_next!5455))))

(declare-fun tp!19405 () Bool)

(declare-fun b_and!12175 () Bool)

(assert (=> start!20806 (= tp!19405 b_and!12175)))

(declare-fun b!208343 () Bool)

(declare-fun e!135871 () Bool)

(declare-fun tp_is_empty!5317 () Bool)

(assert (=> b!208343 (= e!135871 tp_is_empty!5317)))

(declare-fun b!208344 () Bool)

(declare-fun res!101337 () Bool)

(declare-fun e!135872 () Bool)

(assert (=> b!208344 (=> (not res!101337) (not e!135872))))

(declare-datatypes ((array!9823 0))(
  ( (array!9824 (arr!4661 (Array (_ BitVec 32) (_ BitVec 64))) (size!4987 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9823)

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!208344 (= res!101337 (= (select (arr!4661 _keys!825) i!601) k0!843))))

(declare-fun mapNonEmpty!9044 () Bool)

(declare-fun mapRes!9044 () Bool)

(declare-fun tp!19406 () Bool)

(declare-fun e!135869 () Bool)

(assert (=> mapNonEmpty!9044 (= mapRes!9044 (and tp!19406 e!135869))))

(declare-fun mapKey!9044 () (_ BitVec 32))

(declare-datatypes ((V!6737 0))(
  ( (V!6738 (val!2703 Int)) )
))
(declare-datatypes ((ValueCell!2315 0))(
  ( (ValueCellFull!2315 (v!4667 V!6737)) (EmptyCell!2315) )
))
(declare-fun mapRest!9044 () (Array (_ BitVec 32) ValueCell!2315))

(declare-fun mapValue!9044 () ValueCell!2315)

(declare-datatypes ((array!9825 0))(
  ( (array!9826 (arr!4662 (Array (_ BitVec 32) ValueCell!2315)) (size!4988 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9825)

(assert (=> mapNonEmpty!9044 (= (arr!4662 _values!649) (store mapRest!9044 mapKey!9044 mapValue!9044))))

(declare-fun mapIsEmpty!9044 () Bool)

(assert (=> mapIsEmpty!9044 mapRes!9044))

(declare-fun b!208345 () Bool)

(declare-fun res!101342 () Bool)

(assert (=> b!208345 (=> (not res!101342) (not e!135872))))

(assert (=> b!208345 (= res!101342 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4987 _keys!825))))))

(declare-fun b!208346 () Bool)

(declare-fun res!101341 () Bool)

(assert (=> b!208346 (=> (not res!101341) (not e!135872))))

(declare-datatypes ((List!2980 0))(
  ( (Nil!2977) (Cons!2976 (h!3618 (_ BitVec 64)) (t!7902 List!2980)) )
))
(declare-fun arrayNoDuplicates!0 (array!9823 (_ BitVec 32) List!2980) Bool)

(assert (=> b!208346 (= res!101341 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2977))))

(declare-fun b!208347 () Bool)

(assert (=> b!208347 (= e!135869 tp_is_empty!5317)))

(declare-fun b!208349 () Bool)

(declare-fun res!101340 () Bool)

(assert (=> b!208349 (=> (not res!101340) (not e!135872))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!208349 (= res!101340 (validKeyInArray!0 k0!843))))

(declare-fun b!208350 () Bool)

(declare-fun res!101339 () Bool)

(assert (=> b!208350 (=> (not res!101339) (not e!135872))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!208350 (= res!101339 (and (= (size!4988 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4987 _keys!825) (size!4988 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!208351 () Bool)

(declare-fun e!135873 () Bool)

(assert (=> b!208351 (= e!135873 (and e!135871 mapRes!9044))))

(declare-fun condMapEmpty!9044 () Bool)

(declare-fun mapDefault!9044 () ValueCell!2315)

(assert (=> b!208351 (= condMapEmpty!9044 (= (arr!4662 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2315)) mapDefault!9044)))))

(declare-fun b!208352 () Bool)

(declare-fun res!101336 () Bool)

(assert (=> b!208352 (=> (not res!101336) (not e!135872))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9823 (_ BitVec 32)) Bool)

(assert (=> b!208352 (= res!101336 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!208348 () Bool)

(assert (=> b!208348 (= e!135872 false)))

(declare-fun v!520 () V!6737)

(declare-fun zeroValue!615 () V!6737)

(declare-datatypes ((tuple2!4072 0))(
  ( (tuple2!4073 (_1!2047 (_ BitVec 64)) (_2!2047 V!6737)) )
))
(declare-datatypes ((List!2981 0))(
  ( (Nil!2978) (Cons!2977 (h!3619 tuple2!4072) (t!7903 List!2981)) )
))
(declare-datatypes ((ListLongMap!2975 0))(
  ( (ListLongMap!2976 (toList!1503 List!2981)) )
))
(declare-fun lt!106616 () ListLongMap!2975)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6737)

(declare-fun getCurrentListMapNoExtraKeys!454 (array!9823 array!9825 (_ BitVec 32) (_ BitVec 32) V!6737 V!6737 (_ BitVec 32) Int) ListLongMap!2975)

(assert (=> b!208348 (= lt!106616 (getCurrentListMapNoExtraKeys!454 _keys!825 (array!9826 (store (arr!4662 _values!649) i!601 (ValueCellFull!2315 v!520)) (size!4988 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!106615 () ListLongMap!2975)

(assert (=> b!208348 (= lt!106615 (getCurrentListMapNoExtraKeys!454 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun res!101338 () Bool)

(assert (=> start!20806 (=> (not res!101338) (not e!135872))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20806 (= res!101338 (validMask!0 mask!1149))))

(assert (=> start!20806 e!135872))

(declare-fun array_inv!3061 (array!9825) Bool)

(assert (=> start!20806 (and (array_inv!3061 _values!649) e!135873)))

(assert (=> start!20806 true))

(assert (=> start!20806 tp_is_empty!5317))

(declare-fun array_inv!3062 (array!9823) Bool)

(assert (=> start!20806 (array_inv!3062 _keys!825)))

(assert (=> start!20806 tp!19405))

(assert (= (and start!20806 res!101338) b!208350))

(assert (= (and b!208350 res!101339) b!208352))

(assert (= (and b!208352 res!101336) b!208346))

(assert (= (and b!208346 res!101341) b!208345))

(assert (= (and b!208345 res!101342) b!208349))

(assert (= (and b!208349 res!101340) b!208344))

(assert (= (and b!208344 res!101337) b!208348))

(assert (= (and b!208351 condMapEmpty!9044) mapIsEmpty!9044))

(assert (= (and b!208351 (not condMapEmpty!9044)) mapNonEmpty!9044))

(get-info :version)

(assert (= (and mapNonEmpty!9044 ((_ is ValueCellFull!2315) mapValue!9044)) b!208347))

(assert (= (and b!208351 ((_ is ValueCellFull!2315) mapDefault!9044)) b!208343))

(assert (= start!20806 b!208351))

(declare-fun m!235491 () Bool)

(assert (=> b!208352 m!235491))

(declare-fun m!235493 () Bool)

(assert (=> b!208344 m!235493))

(declare-fun m!235495 () Bool)

(assert (=> b!208346 m!235495))

(declare-fun m!235497 () Bool)

(assert (=> b!208349 m!235497))

(declare-fun m!235499 () Bool)

(assert (=> start!20806 m!235499))

(declare-fun m!235501 () Bool)

(assert (=> start!20806 m!235501))

(declare-fun m!235503 () Bool)

(assert (=> start!20806 m!235503))

(declare-fun m!235505 () Bool)

(assert (=> mapNonEmpty!9044 m!235505))

(declare-fun m!235507 () Bool)

(assert (=> b!208348 m!235507))

(declare-fun m!235509 () Bool)

(assert (=> b!208348 m!235509))

(declare-fun m!235511 () Bool)

(assert (=> b!208348 m!235511))

(check-sat (not b!208352) (not b!208346) b_and!12175 tp_is_empty!5317 (not mapNonEmpty!9044) (not start!20806) (not b!208348) (not b!208349) (not b_next!5455))
(check-sat b_and!12175 (not b_next!5455))

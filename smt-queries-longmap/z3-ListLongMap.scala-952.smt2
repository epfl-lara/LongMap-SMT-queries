; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20810 () Bool)

(assert start!20810)

(declare-fun b_free!5463 () Bool)

(declare-fun b_next!5463 () Bool)

(assert (=> start!20810 (= b_free!5463 (not b_next!5463))))

(declare-fun tp!19430 () Bool)

(declare-fun b_and!12209 () Bool)

(assert (=> start!20810 (= tp!19430 b_and!12209)))

(declare-fun b!208610 () Bool)

(declare-fun e!136034 () Bool)

(declare-fun tp_is_empty!5325 () Bool)

(assert (=> b!208610 (= e!136034 tp_is_empty!5325)))

(declare-fun b!208611 () Bool)

(declare-fun res!101516 () Bool)

(declare-fun e!136031 () Bool)

(assert (=> b!208611 (=> (not res!101516) (not e!136031))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!208611 (= res!101516 (validKeyInArray!0 k0!843))))

(declare-fun b!208612 () Bool)

(declare-fun e!136030 () Bool)

(declare-fun e!136032 () Bool)

(declare-fun mapRes!9056 () Bool)

(assert (=> b!208612 (= e!136030 (and e!136032 mapRes!9056))))

(declare-fun condMapEmpty!9056 () Bool)

(declare-datatypes ((V!6747 0))(
  ( (V!6748 (val!2707 Int)) )
))
(declare-datatypes ((ValueCell!2319 0))(
  ( (ValueCellFull!2319 (v!4677 V!6747)) (EmptyCell!2319) )
))
(declare-datatypes ((array!9853 0))(
  ( (array!9854 (arr!4677 (Array (_ BitVec 32) ValueCell!2319)) (size!5002 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9853)

(declare-fun mapDefault!9056 () ValueCell!2319)

(assert (=> b!208612 (= condMapEmpty!9056 (= (arr!4677 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2319)) mapDefault!9056)))))

(declare-fun b!208613 () Bool)

(declare-fun res!101519 () Bool)

(assert (=> b!208613 (=> (not res!101519) (not e!136031))))

(declare-datatypes ((array!9855 0))(
  ( (array!9856 (arr!4678 (Array (_ BitVec 32) (_ BitVec 64))) (size!5003 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9855)

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!208613 (= res!101519 (= (select (arr!4678 _keys!825) i!601) k0!843))))

(declare-fun b!208614 () Bool)

(assert (=> b!208614 (= e!136031 false)))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-datatypes ((tuple2!4100 0))(
  ( (tuple2!4101 (_1!2061 (_ BitVec 64)) (_2!2061 V!6747)) )
))
(declare-datatypes ((List!2996 0))(
  ( (Nil!2993) (Cons!2992 (h!3634 tuple2!4100) (t!7927 List!2996)) )
))
(declare-datatypes ((ListLongMap!3013 0))(
  ( (ListLongMap!3014 (toList!1522 List!2996)) )
))
(declare-fun lt!106821 () ListLongMap!3013)

(declare-fun v!520 () V!6747)

(declare-fun zeroValue!615 () V!6747)

(declare-fun defaultEntry!657 () Int)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!6747)

(declare-fun getCurrentListMapNoExtraKeys!463 (array!9855 array!9853 (_ BitVec 32) (_ BitVec 32) V!6747 V!6747 (_ BitVec 32) Int) ListLongMap!3013)

(assert (=> b!208614 (= lt!106821 (getCurrentListMapNoExtraKeys!463 _keys!825 (array!9854 (store (arr!4677 _values!649) i!601 (ValueCellFull!2319 v!520)) (size!5002 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!106820 () ListLongMap!3013)

(assert (=> b!208614 (= lt!106820 (getCurrentListMapNoExtraKeys!463 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun res!101520 () Bool)

(assert (=> start!20810 (=> (not res!101520) (not e!136031))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20810 (= res!101520 (validMask!0 mask!1149))))

(assert (=> start!20810 e!136031))

(declare-fun array_inv!3103 (array!9853) Bool)

(assert (=> start!20810 (and (array_inv!3103 _values!649) e!136030)))

(assert (=> start!20810 true))

(assert (=> start!20810 tp_is_empty!5325))

(declare-fun array_inv!3104 (array!9855) Bool)

(assert (=> start!20810 (array_inv!3104 _keys!825)))

(assert (=> start!20810 tp!19430))

(declare-fun b!208615 () Bool)

(assert (=> b!208615 (= e!136032 tp_is_empty!5325)))

(declare-fun b!208616 () Bool)

(declare-fun res!101517 () Bool)

(assert (=> b!208616 (=> (not res!101517) (not e!136031))))

(assert (=> b!208616 (= res!101517 (and (= (size!5002 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!5003 _keys!825) (size!5002 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!208617 () Bool)

(declare-fun res!101521 () Bool)

(assert (=> b!208617 (=> (not res!101521) (not e!136031))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9855 (_ BitVec 32)) Bool)

(assert (=> b!208617 (= res!101521 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun mapIsEmpty!9056 () Bool)

(assert (=> mapIsEmpty!9056 mapRes!9056))

(declare-fun mapNonEmpty!9056 () Bool)

(declare-fun tp!19429 () Bool)

(assert (=> mapNonEmpty!9056 (= mapRes!9056 (and tp!19429 e!136034))))

(declare-fun mapValue!9056 () ValueCell!2319)

(declare-fun mapKey!9056 () (_ BitVec 32))

(declare-fun mapRest!9056 () (Array (_ BitVec 32) ValueCell!2319))

(assert (=> mapNonEmpty!9056 (= (arr!4677 _values!649) (store mapRest!9056 mapKey!9056 mapValue!9056))))

(declare-fun b!208618 () Bool)

(declare-fun res!101518 () Bool)

(assert (=> b!208618 (=> (not res!101518) (not e!136031))))

(assert (=> b!208618 (= res!101518 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5003 _keys!825))))))

(declare-fun b!208619 () Bool)

(declare-fun res!101515 () Bool)

(assert (=> b!208619 (=> (not res!101515) (not e!136031))))

(declare-datatypes ((List!2997 0))(
  ( (Nil!2994) (Cons!2993 (h!3635 (_ BitVec 64)) (t!7928 List!2997)) )
))
(declare-fun arrayNoDuplicates!0 (array!9855 (_ BitVec 32) List!2997) Bool)

(assert (=> b!208619 (= res!101515 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2994))))

(assert (= (and start!20810 res!101520) b!208616))

(assert (= (and b!208616 res!101517) b!208617))

(assert (= (and b!208617 res!101521) b!208619))

(assert (= (and b!208619 res!101515) b!208618))

(assert (= (and b!208618 res!101518) b!208611))

(assert (= (and b!208611 res!101516) b!208613))

(assert (= (and b!208613 res!101519) b!208614))

(assert (= (and b!208612 condMapEmpty!9056) mapIsEmpty!9056))

(assert (= (and b!208612 (not condMapEmpty!9056)) mapNonEmpty!9056))

(get-info :version)

(assert (= (and mapNonEmpty!9056 ((_ is ValueCellFull!2319) mapValue!9056)) b!208610))

(assert (= (and b!208612 ((_ is ValueCellFull!2319) mapDefault!9056)) b!208615))

(assert (= start!20810 b!208612))

(declare-fun m!236195 () Bool)

(assert (=> b!208617 m!236195))

(declare-fun m!236197 () Bool)

(assert (=> b!208611 m!236197))

(declare-fun m!236199 () Bool)

(assert (=> b!208619 m!236199))

(declare-fun m!236201 () Bool)

(assert (=> mapNonEmpty!9056 m!236201))

(declare-fun m!236203 () Bool)

(assert (=> b!208613 m!236203))

(declare-fun m!236205 () Bool)

(assert (=> start!20810 m!236205))

(declare-fun m!236207 () Bool)

(assert (=> start!20810 m!236207))

(declare-fun m!236209 () Bool)

(assert (=> start!20810 m!236209))

(declare-fun m!236211 () Bool)

(assert (=> b!208614 m!236211))

(declare-fun m!236213 () Bool)

(assert (=> b!208614 m!236213))

(declare-fun m!236215 () Bool)

(assert (=> b!208614 m!236215))

(check-sat (not b!208614) (not b_next!5463) tp_is_empty!5325 (not start!20810) (not b!208611) (not mapNonEmpty!9056) b_and!12209 (not b!208617) (not b!208619))
(check-sat b_and!12209 (not b_next!5463))

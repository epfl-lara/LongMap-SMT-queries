; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20798 () Bool)

(assert start!20798)

(declare-fun b_free!5451 () Bool)

(declare-fun b_next!5451 () Bool)

(assert (=> start!20798 (= b_free!5451 (not b_next!5451))))

(declare-fun tp!19393 () Bool)

(declare-fun b_and!12197 () Bool)

(assert (=> start!20798 (= tp!19393 b_and!12197)))

(declare-fun b!208430 () Bool)

(declare-fun res!101392 () Bool)

(declare-fun e!135940 () Bool)

(assert (=> b!208430 (=> (not res!101392) (not e!135940))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!208430 (= res!101392 (validKeyInArray!0 k0!843))))

(declare-fun b!208431 () Bool)

(declare-fun res!101391 () Bool)

(assert (=> b!208431 (=> (not res!101391) (not e!135940))))

(declare-datatypes ((array!9829 0))(
  ( (array!9830 (arr!4665 (Array (_ BitVec 32) (_ BitVec 64))) (size!4990 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9829)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9829 (_ BitVec 32)) Bool)

(assert (=> b!208431 (= res!101391 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!208433 () Bool)

(declare-fun e!135942 () Bool)

(declare-fun tp_is_empty!5313 () Bool)

(assert (=> b!208433 (= e!135942 tp_is_empty!5313)))

(declare-fun mapNonEmpty!9038 () Bool)

(declare-fun mapRes!9038 () Bool)

(declare-fun tp!19394 () Bool)

(assert (=> mapNonEmpty!9038 (= mapRes!9038 (and tp!19394 e!135942))))

(declare-datatypes ((V!6731 0))(
  ( (V!6732 (val!2701 Int)) )
))
(declare-datatypes ((ValueCell!2313 0))(
  ( (ValueCellFull!2313 (v!4671 V!6731)) (EmptyCell!2313) )
))
(declare-fun mapValue!9038 () ValueCell!2313)

(declare-datatypes ((array!9831 0))(
  ( (array!9832 (arr!4666 (Array (_ BitVec 32) ValueCell!2313)) (size!4991 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9831)

(declare-fun mapRest!9038 () (Array (_ BitVec 32) ValueCell!2313))

(declare-fun mapKey!9038 () (_ BitVec 32))

(assert (=> mapNonEmpty!9038 (= (arr!4666 _values!649) (store mapRest!9038 mapKey!9038 mapValue!9038))))

(declare-fun b!208434 () Bool)

(declare-fun res!101390 () Bool)

(assert (=> b!208434 (=> (not res!101390) (not e!135940))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!208434 (= res!101390 (and (= (size!4991 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4990 _keys!825) (size!4991 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!208435 () Bool)

(declare-fun res!101394 () Bool)

(assert (=> b!208435 (=> (not res!101394) (not e!135940))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!208435 (= res!101394 (= (select (arr!4665 _keys!825) i!601) k0!843))))

(declare-fun mapIsEmpty!9038 () Bool)

(assert (=> mapIsEmpty!9038 mapRes!9038))

(declare-fun b!208436 () Bool)

(declare-fun res!101389 () Bool)

(assert (=> b!208436 (=> (not res!101389) (not e!135940))))

(declare-datatypes ((List!2989 0))(
  ( (Nil!2986) (Cons!2985 (h!3627 (_ BitVec 64)) (t!7920 List!2989)) )
))
(declare-fun arrayNoDuplicates!0 (array!9829 (_ BitVec 32) List!2989) Bool)

(assert (=> b!208436 (= res!101389 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2986))))

(declare-fun b!208437 () Bool)

(declare-fun res!101395 () Bool)

(assert (=> b!208437 (=> (not res!101395) (not e!135940))))

(assert (=> b!208437 (= res!101395 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4990 _keys!825))))))

(declare-fun res!101393 () Bool)

(assert (=> start!20798 (=> (not res!101393) (not e!135940))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20798 (= res!101393 (validMask!0 mask!1149))))

(assert (=> start!20798 e!135940))

(declare-fun e!135943 () Bool)

(declare-fun array_inv!3095 (array!9831) Bool)

(assert (=> start!20798 (and (array_inv!3095 _values!649) e!135943)))

(assert (=> start!20798 true))

(assert (=> start!20798 tp_is_empty!5313))

(declare-fun array_inv!3096 (array!9829) Bool)

(assert (=> start!20798 (array_inv!3096 _keys!825)))

(assert (=> start!20798 tp!19393))

(declare-fun b!208432 () Bool)

(assert (=> b!208432 (= e!135940 false)))

(declare-datatypes ((tuple2!4094 0))(
  ( (tuple2!4095 (_1!2058 (_ BitVec 64)) (_2!2058 V!6731)) )
))
(declare-datatypes ((List!2990 0))(
  ( (Nil!2987) (Cons!2986 (h!3628 tuple2!4094) (t!7921 List!2990)) )
))
(declare-datatypes ((ListLongMap!3007 0))(
  ( (ListLongMap!3008 (toList!1519 List!2990)) )
))
(declare-fun lt!106784 () ListLongMap!3007)

(declare-fun v!520 () V!6731)

(declare-fun zeroValue!615 () V!6731)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6731)

(declare-fun getCurrentListMapNoExtraKeys!460 (array!9829 array!9831 (_ BitVec 32) (_ BitVec 32) V!6731 V!6731 (_ BitVec 32) Int) ListLongMap!3007)

(assert (=> b!208432 (= lt!106784 (getCurrentListMapNoExtraKeys!460 _keys!825 (array!9832 (store (arr!4666 _values!649) i!601 (ValueCellFull!2313 v!520)) (size!4991 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!106785 () ListLongMap!3007)

(assert (=> b!208432 (= lt!106785 (getCurrentListMapNoExtraKeys!460 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!208438 () Bool)

(declare-fun e!135941 () Bool)

(assert (=> b!208438 (= e!135941 tp_is_empty!5313)))

(declare-fun b!208439 () Bool)

(assert (=> b!208439 (= e!135943 (and e!135941 mapRes!9038))))

(declare-fun condMapEmpty!9038 () Bool)

(declare-fun mapDefault!9038 () ValueCell!2313)

(assert (=> b!208439 (= condMapEmpty!9038 (= (arr!4666 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2313)) mapDefault!9038)))))

(assert (= (and start!20798 res!101393) b!208434))

(assert (= (and b!208434 res!101390) b!208431))

(assert (= (and b!208431 res!101391) b!208436))

(assert (= (and b!208436 res!101389) b!208437))

(assert (= (and b!208437 res!101395) b!208430))

(assert (= (and b!208430 res!101392) b!208435))

(assert (= (and b!208435 res!101394) b!208432))

(assert (= (and b!208439 condMapEmpty!9038) mapIsEmpty!9038))

(assert (= (and b!208439 (not condMapEmpty!9038)) mapNonEmpty!9038))

(get-info :version)

(assert (= (and mapNonEmpty!9038 ((_ is ValueCellFull!2313) mapValue!9038)) b!208433))

(assert (= (and b!208439 ((_ is ValueCellFull!2313) mapDefault!9038)) b!208438))

(assert (= start!20798 b!208439))

(declare-fun m!236063 () Bool)

(assert (=> b!208431 m!236063))

(declare-fun m!236065 () Bool)

(assert (=> b!208435 m!236065))

(declare-fun m!236067 () Bool)

(assert (=> b!208436 m!236067))

(declare-fun m!236069 () Bool)

(assert (=> b!208430 m!236069))

(declare-fun m!236071 () Bool)

(assert (=> mapNonEmpty!9038 m!236071))

(declare-fun m!236073 () Bool)

(assert (=> b!208432 m!236073))

(declare-fun m!236075 () Bool)

(assert (=> b!208432 m!236075))

(declare-fun m!236077 () Bool)

(assert (=> b!208432 m!236077))

(declare-fun m!236079 () Bool)

(assert (=> start!20798 m!236079))

(declare-fun m!236081 () Bool)

(assert (=> start!20798 m!236081))

(declare-fun m!236083 () Bool)

(assert (=> start!20798 m!236083))

(check-sat (not b!208430) (not b!208436) tp_is_empty!5313 (not b!208431) (not start!20798) (not b_next!5451) (not mapNonEmpty!9038) b_and!12197 (not b!208432))
(check-sat b_and!12197 (not b_next!5451))

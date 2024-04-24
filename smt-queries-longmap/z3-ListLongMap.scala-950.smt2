; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20800 () Bool)

(assert start!20800)

(declare-fun b_free!5449 () Bool)

(declare-fun b_next!5449 () Bool)

(assert (=> start!20800 (= b_free!5449 (not b_next!5449))))

(declare-fun tp!19387 () Bool)

(declare-fun b_and!12209 () Bool)

(assert (=> start!20800 (= tp!19387 b_and!12209)))

(declare-fun res!101393 () Bool)

(declare-fun e!135950 () Bool)

(assert (=> start!20800 (=> (not res!101393) (not e!135950))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20800 (= res!101393 (validMask!0 mask!1149))))

(assert (=> start!20800 e!135950))

(declare-datatypes ((V!6729 0))(
  ( (V!6730 (val!2700 Int)) )
))
(declare-datatypes ((ValueCell!2312 0))(
  ( (ValueCellFull!2312 (v!4671 V!6729)) (EmptyCell!2312) )
))
(declare-datatypes ((array!9819 0))(
  ( (array!9820 (arr!4660 (Array (_ BitVec 32) ValueCell!2312)) (size!4985 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9819)

(declare-fun e!135953 () Bool)

(declare-fun array_inv!3055 (array!9819) Bool)

(assert (=> start!20800 (and (array_inv!3055 _values!649) e!135953)))

(assert (=> start!20800 true))

(declare-fun tp_is_empty!5311 () Bool)

(assert (=> start!20800 tp_is_empty!5311))

(declare-datatypes ((array!9821 0))(
  ( (array!9822 (arr!4661 (Array (_ BitVec 32) (_ BitVec 64))) (size!4986 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9821)

(declare-fun array_inv!3056 (array!9821) Bool)

(assert (=> start!20800 (array_inv!3056 _keys!825)))

(assert (=> start!20800 tp!19387))

(declare-fun b!208447 () Bool)

(declare-fun res!101394 () Bool)

(assert (=> b!208447 (=> (not res!101394) (not e!135950))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!208447 (= res!101394 (and (= (size!4985 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4986 _keys!825) (size!4985 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!208448 () Bool)

(declare-fun res!101392 () Bool)

(assert (=> b!208448 (=> (not res!101392) (not e!135950))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9821 (_ BitVec 32)) Bool)

(assert (=> b!208448 (= res!101392 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!208449 () Bool)

(declare-fun res!101389 () Bool)

(assert (=> b!208449 (=> (not res!101389) (not e!135950))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!208449 (= res!101389 (validKeyInArray!0 k0!843))))

(declare-fun b!208450 () Bool)

(declare-fun res!101391 () Bool)

(assert (=> b!208450 (=> (not res!101391) (not e!135950))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!208450 (= res!101391 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4986 _keys!825))))))

(declare-fun b!208451 () Bool)

(declare-fun e!135951 () Bool)

(declare-fun mapRes!9035 () Bool)

(assert (=> b!208451 (= e!135953 (and e!135951 mapRes!9035))))

(declare-fun condMapEmpty!9035 () Bool)

(declare-fun mapDefault!9035 () ValueCell!2312)

(assert (=> b!208451 (= condMapEmpty!9035 (= (arr!4660 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2312)) mapDefault!9035)))))

(declare-fun b!208452 () Bool)

(assert (=> b!208452 (= e!135951 tp_is_empty!5311)))

(declare-fun mapNonEmpty!9035 () Bool)

(declare-fun tp!19388 () Bool)

(declare-fun e!135952 () Bool)

(assert (=> mapNonEmpty!9035 (= mapRes!9035 (and tp!19388 e!135952))))

(declare-fun mapKey!9035 () (_ BitVec 32))

(declare-fun mapRest!9035 () (Array (_ BitVec 32) ValueCell!2312))

(declare-fun mapValue!9035 () ValueCell!2312)

(assert (=> mapNonEmpty!9035 (= (arr!4660 _values!649) (store mapRest!9035 mapKey!9035 mapValue!9035))))

(declare-fun b!208453 () Bool)

(assert (=> b!208453 (= e!135952 tp_is_empty!5311)))

(declare-fun mapIsEmpty!9035 () Bool)

(assert (=> mapIsEmpty!9035 mapRes!9035))

(declare-fun b!208454 () Bool)

(declare-fun res!101390 () Bool)

(assert (=> b!208454 (=> (not res!101390) (not e!135950))))

(declare-datatypes ((List!2919 0))(
  ( (Nil!2916) (Cons!2915 (h!3557 (_ BitVec 64)) (t!7842 List!2919)) )
))
(declare-fun arrayNoDuplicates!0 (array!9821 (_ BitVec 32) List!2919) Bool)

(assert (=> b!208454 (= res!101390 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2916))))

(declare-fun b!208455 () Bool)

(assert (=> b!208455 (= e!135950 false)))

(declare-fun v!520 () V!6729)

(declare-fun zeroValue!615 () V!6729)

(declare-datatypes ((tuple2!4030 0))(
  ( (tuple2!4031 (_1!2026 (_ BitVec 64)) (_2!2026 V!6729)) )
))
(declare-datatypes ((List!2920 0))(
  ( (Nil!2917) (Cons!2916 (h!3558 tuple2!4030) (t!7843 List!2920)) )
))
(declare-datatypes ((ListLongMap!2945 0))(
  ( (ListLongMap!2946 (toList!1488 List!2920)) )
))
(declare-fun lt!106837 () ListLongMap!2945)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6729)

(declare-fun getCurrentListMapNoExtraKeys!451 (array!9821 array!9819 (_ BitVec 32) (_ BitVec 32) V!6729 V!6729 (_ BitVec 32) Int) ListLongMap!2945)

(assert (=> b!208455 (= lt!106837 (getCurrentListMapNoExtraKeys!451 _keys!825 (array!9820 (store (arr!4660 _values!649) i!601 (ValueCellFull!2312 v!520)) (size!4985 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!106838 () ListLongMap!2945)

(assert (=> b!208455 (= lt!106838 (getCurrentListMapNoExtraKeys!451 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!208456 () Bool)

(declare-fun res!101395 () Bool)

(assert (=> b!208456 (=> (not res!101395) (not e!135950))))

(assert (=> b!208456 (= res!101395 (= (select (arr!4661 _keys!825) i!601) k0!843))))

(assert (= (and start!20800 res!101393) b!208447))

(assert (= (and b!208447 res!101394) b!208448))

(assert (= (and b!208448 res!101392) b!208454))

(assert (= (and b!208454 res!101390) b!208450))

(assert (= (and b!208450 res!101391) b!208449))

(assert (= (and b!208449 res!101389) b!208456))

(assert (= (and b!208456 res!101395) b!208455))

(assert (= (and b!208451 condMapEmpty!9035) mapIsEmpty!9035))

(assert (= (and b!208451 (not condMapEmpty!9035)) mapNonEmpty!9035))

(get-info :version)

(assert (= (and mapNonEmpty!9035 ((_ is ValueCellFull!2312) mapValue!9035)) b!208453))

(assert (= (and b!208451 ((_ is ValueCellFull!2312) mapDefault!9035)) b!208452))

(assert (= start!20800 b!208451))

(declare-fun m!236223 () Bool)

(assert (=> b!208449 m!236223))

(declare-fun m!236225 () Bool)

(assert (=> b!208448 m!236225))

(declare-fun m!236227 () Bool)

(assert (=> b!208454 m!236227))

(declare-fun m!236229 () Bool)

(assert (=> start!20800 m!236229))

(declare-fun m!236231 () Bool)

(assert (=> start!20800 m!236231))

(declare-fun m!236233 () Bool)

(assert (=> start!20800 m!236233))

(declare-fun m!236235 () Bool)

(assert (=> mapNonEmpty!9035 m!236235))

(declare-fun m!236237 () Bool)

(assert (=> b!208456 m!236237))

(declare-fun m!236239 () Bool)

(assert (=> b!208455 m!236239))

(declare-fun m!236241 () Bool)

(assert (=> b!208455 m!236241))

(declare-fun m!236243 () Bool)

(assert (=> b!208455 m!236243))

(check-sat (not b!208454) (not start!20800) tp_is_empty!5311 (not b_next!5449) (not mapNonEmpty!9035) (not b!208455) (not b!208449) (not b!208448) b_and!12209)
(check-sat b_and!12209 (not b_next!5449))

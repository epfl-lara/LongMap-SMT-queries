; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20734 () Bool)

(assert start!20734)

(declare-fun b_free!5389 () Bool)

(declare-fun b_next!5389 () Bool)

(assert (=> start!20734 (= b_free!5389 (not b_next!5389))))

(declare-fun tp!19198 () Bool)

(declare-fun b_and!12149 () Bool)

(assert (=> start!20734 (= tp!19198 b_and!12149)))

(declare-fun b!207493 () Bool)

(declare-fun e!135455 () Bool)

(declare-fun tp_is_empty!5245 () Bool)

(assert (=> b!207493 (= e!135455 tp_is_empty!5245)))

(declare-fun mapIsEmpty!8936 () Bool)

(declare-fun mapRes!8936 () Bool)

(assert (=> mapIsEmpty!8936 mapRes!8936))

(declare-fun b!207494 () Bool)

(declare-fun res!100732 () Bool)

(declare-fun e!135458 () Bool)

(assert (=> b!207494 (=> (not res!100732) (not e!135458))))

(declare-datatypes ((array!9693 0))(
  ( (array!9694 (arr!4597 (Array (_ BitVec 32) (_ BitVec 64))) (size!4922 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9693)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9693 (_ BitVec 32)) Bool)

(assert (=> b!207494 (= res!100732 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!207495 () Bool)

(assert (=> b!207495 (= e!135458 (not true))))

(declare-datatypes ((V!6641 0))(
  ( (V!6642 (val!2667 Int)) )
))
(declare-datatypes ((tuple2!3992 0))(
  ( (tuple2!3993 (_1!2007 (_ BitVec 64)) (_2!2007 V!6641)) )
))
(declare-datatypes ((List!2881 0))(
  ( (Nil!2878) (Cons!2877 (h!3519 tuple2!3992) (t!7804 List!2881)) )
))
(declare-datatypes ((ListLongMap!2907 0))(
  ( (ListLongMap!2908 (toList!1469 List!2881)) )
))
(declare-fun lt!106349 () ListLongMap!2907)

(declare-datatypes ((ValueCell!2279 0))(
  ( (ValueCellFull!2279 (v!4638 V!6641)) (EmptyCell!2279) )
))
(declare-datatypes ((array!9695 0))(
  ( (array!9696 (arr!4598 (Array (_ BitVec 32) ValueCell!2279)) (size!4923 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9695)

(declare-fun zeroValue!615 () V!6641)

(declare-fun defaultEntry!657 () Int)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!6641)

(declare-fun getCurrentListMap!1039 (array!9693 array!9695 (_ BitVec 32) (_ BitVec 32) V!6641 V!6641 (_ BitVec 32) Int) ListLongMap!2907)

(assert (=> b!207495 (= lt!106349 (getCurrentListMap!1039 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!106348 () ListLongMap!2907)

(declare-fun lt!106346 () array!9695)

(assert (=> b!207495 (= lt!106348 (getCurrentListMap!1039 _keys!825 lt!106346 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!106344 () ListLongMap!2907)

(declare-fun lt!106347 () ListLongMap!2907)

(assert (=> b!207495 (and (= lt!106344 lt!106347) (= lt!106347 lt!106344))))

(declare-fun v!520 () V!6641)

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun lt!106343 () ListLongMap!2907)

(declare-fun +!523 (ListLongMap!2907 tuple2!3992) ListLongMap!2907)

(assert (=> b!207495 (= lt!106347 (+!523 lt!106343 (tuple2!3993 k0!843 v!520)))))

(declare-datatypes ((Unit!6322 0))(
  ( (Unit!6323) )
))
(declare-fun lt!106345 () Unit!6322)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!175 (array!9693 array!9695 (_ BitVec 32) (_ BitVec 32) V!6641 V!6641 (_ BitVec 32) (_ BitVec 64) V!6641 (_ BitVec 32) Int) Unit!6322)

(assert (=> b!207495 (= lt!106345 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!175 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!432 (array!9693 array!9695 (_ BitVec 32) (_ BitVec 32) V!6641 V!6641 (_ BitVec 32) Int) ListLongMap!2907)

(assert (=> b!207495 (= lt!106344 (getCurrentListMapNoExtraKeys!432 _keys!825 lt!106346 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!207495 (= lt!106346 (array!9696 (store (arr!4598 _values!649) i!601 (ValueCellFull!2279 v!520)) (size!4923 _values!649)))))

(assert (=> b!207495 (= lt!106343 (getCurrentListMapNoExtraKeys!432 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!207496 () Bool)

(declare-fun res!100736 () Bool)

(assert (=> b!207496 (=> (not res!100736) (not e!135458))))

(assert (=> b!207496 (= res!100736 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4922 _keys!825))))))

(declare-fun b!207497 () Bool)

(declare-fun e!135457 () Bool)

(assert (=> b!207497 (= e!135457 tp_is_empty!5245)))

(declare-fun b!207498 () Bool)

(declare-fun e!135456 () Bool)

(assert (=> b!207498 (= e!135456 (and e!135457 mapRes!8936))))

(declare-fun condMapEmpty!8936 () Bool)

(declare-fun mapDefault!8936 () ValueCell!2279)

(assert (=> b!207498 (= condMapEmpty!8936 (= (arr!4598 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2279)) mapDefault!8936)))))

(declare-fun b!207499 () Bool)

(declare-fun res!100734 () Bool)

(assert (=> b!207499 (=> (not res!100734) (not e!135458))))

(assert (=> b!207499 (= res!100734 (and (= (size!4923 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4922 _keys!825) (size!4923 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun res!100733 () Bool)

(assert (=> start!20734 (=> (not res!100733) (not e!135458))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20734 (= res!100733 (validMask!0 mask!1149))))

(assert (=> start!20734 e!135458))

(declare-fun array_inv!3011 (array!9695) Bool)

(assert (=> start!20734 (and (array_inv!3011 _values!649) e!135456)))

(assert (=> start!20734 true))

(assert (=> start!20734 tp_is_empty!5245))

(declare-fun array_inv!3012 (array!9693) Bool)

(assert (=> start!20734 (array_inv!3012 _keys!825)))

(assert (=> start!20734 tp!19198))

(declare-fun b!207500 () Bool)

(declare-fun res!100737 () Bool)

(assert (=> b!207500 (=> (not res!100737) (not e!135458))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!207500 (= res!100737 (validKeyInArray!0 k0!843))))

(declare-fun b!207501 () Bool)

(declare-fun res!100738 () Bool)

(assert (=> b!207501 (=> (not res!100738) (not e!135458))))

(assert (=> b!207501 (= res!100738 (= (select (arr!4597 _keys!825) i!601) k0!843))))

(declare-fun b!207502 () Bool)

(declare-fun res!100735 () Bool)

(assert (=> b!207502 (=> (not res!100735) (not e!135458))))

(declare-datatypes ((List!2882 0))(
  ( (Nil!2879) (Cons!2878 (h!3520 (_ BitVec 64)) (t!7805 List!2882)) )
))
(declare-fun arrayNoDuplicates!0 (array!9693 (_ BitVec 32) List!2882) Bool)

(assert (=> b!207502 (= res!100735 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2879))))

(declare-fun mapNonEmpty!8936 () Bool)

(declare-fun tp!19199 () Bool)

(assert (=> mapNonEmpty!8936 (= mapRes!8936 (and tp!19199 e!135455))))

(declare-fun mapRest!8936 () (Array (_ BitVec 32) ValueCell!2279))

(declare-fun mapValue!8936 () ValueCell!2279)

(declare-fun mapKey!8936 () (_ BitVec 32))

(assert (=> mapNonEmpty!8936 (= (arr!4598 _values!649) (store mapRest!8936 mapKey!8936 mapValue!8936))))

(assert (= (and start!20734 res!100733) b!207499))

(assert (= (and b!207499 res!100734) b!207494))

(assert (= (and b!207494 res!100732) b!207502))

(assert (= (and b!207502 res!100735) b!207496))

(assert (= (and b!207496 res!100736) b!207500))

(assert (= (and b!207500 res!100737) b!207501))

(assert (= (and b!207501 res!100738) b!207495))

(assert (= (and b!207498 condMapEmpty!8936) mapIsEmpty!8936))

(assert (= (and b!207498 (not condMapEmpty!8936)) mapNonEmpty!8936))

(get-info :version)

(assert (= (and mapNonEmpty!8936 ((_ is ValueCellFull!2279) mapValue!8936)) b!207493))

(assert (= (and b!207498 ((_ is ValueCellFull!2279) mapDefault!8936)) b!207497))

(assert (= start!20734 b!207498))

(declare-fun m!235371 () Bool)

(assert (=> b!207500 m!235371))

(declare-fun m!235373 () Bool)

(assert (=> b!207501 m!235373))

(declare-fun m!235375 () Bool)

(assert (=> start!20734 m!235375))

(declare-fun m!235377 () Bool)

(assert (=> start!20734 m!235377))

(declare-fun m!235379 () Bool)

(assert (=> start!20734 m!235379))

(declare-fun m!235381 () Bool)

(assert (=> mapNonEmpty!8936 m!235381))

(declare-fun m!235383 () Bool)

(assert (=> b!207495 m!235383))

(declare-fun m!235385 () Bool)

(assert (=> b!207495 m!235385))

(declare-fun m!235387 () Bool)

(assert (=> b!207495 m!235387))

(declare-fun m!235389 () Bool)

(assert (=> b!207495 m!235389))

(declare-fun m!235391 () Bool)

(assert (=> b!207495 m!235391))

(declare-fun m!235393 () Bool)

(assert (=> b!207495 m!235393))

(declare-fun m!235395 () Bool)

(assert (=> b!207495 m!235395))

(declare-fun m!235397 () Bool)

(assert (=> b!207502 m!235397))

(declare-fun m!235399 () Bool)

(assert (=> b!207494 m!235399))

(check-sat (not start!20734) (not b!207495) (not b!207494) (not b_next!5389) tp_is_empty!5245 (not b!207502) (not b!207500) (not mapNonEmpty!8936) b_and!12149)
(check-sat b_and!12149 (not b_next!5389))

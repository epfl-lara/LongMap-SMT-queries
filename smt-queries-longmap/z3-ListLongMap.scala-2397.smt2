; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37936 () Bool)

(assert start!37936)

(declare-fun b_free!8949 () Bool)

(declare-fun b_next!8949 () Bool)

(assert (=> start!37936 (= b_free!8949 (not b_next!8949))))

(declare-fun tp!31611 () Bool)

(declare-fun b_and!16239 () Bool)

(assert (=> start!37936 (= tp!31611 b_and!16239)))

(declare-fun b!390162 () Bool)

(declare-fun e!236356 () Bool)

(declare-fun tp_is_empty!9621 () Bool)

(assert (=> b!390162 (= e!236356 tp_is_empty!9621)))

(declare-fun b!390163 () Bool)

(declare-fun res!223252 () Bool)

(declare-fun e!236352 () Bool)

(assert (=> b!390163 (=> (not res!223252) (not e!236352))))

(declare-datatypes ((array!23139 0))(
  ( (array!23140 (arr!11034 (Array (_ BitVec 32) (_ BitVec 64))) (size!11386 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!23139)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!390163 (= res!223252 (or (= (select (arr!11034 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11034 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!390164 () Bool)

(declare-fun e!236357 () Bool)

(declare-fun e!236353 () Bool)

(assert (=> b!390164 (= e!236357 (not e!236353))))

(declare-fun res!223249 () Bool)

(assert (=> b!390164 (=> res!223249 e!236353)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!390164 (= res!223249 (or (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!13933 0))(
  ( (V!13934 (val!4855 Int)) )
))
(declare-datatypes ((tuple2!6532 0))(
  ( (tuple2!6533 (_1!3277 (_ BitVec 64)) (_2!3277 V!13933)) )
))
(declare-datatypes ((List!6386 0))(
  ( (Nil!6383) (Cons!6382 (h!7238 tuple2!6532) (t!11544 List!6386)) )
))
(declare-datatypes ((ListLongMap!5445 0))(
  ( (ListLongMap!5446 (toList!2738 List!6386)) )
))
(declare-fun lt!183813 () ListLongMap!5445)

(declare-datatypes ((ValueCell!4467 0))(
  ( (ValueCellFull!4467 (v!7068 V!13933)) (EmptyCell!4467) )
))
(declare-datatypes ((array!23141 0))(
  ( (array!23142 (arr!11035 (Array (_ BitVec 32) ValueCell!4467)) (size!11387 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23141)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13933)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun minValue!472 () V!13933)

(declare-fun getCurrentListMap!2086 (array!23139 array!23141 (_ BitVec 32) (_ BitVec 32) V!13933 V!13933 (_ BitVec 32) Int) ListLongMap!5445)

(assert (=> b!390164 (= lt!183813 (getCurrentListMap!2086 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!183815 () ListLongMap!5445)

(declare-fun lt!183817 () array!23141)

(declare-fun lt!183822 () array!23139)

(assert (=> b!390164 (= lt!183815 (getCurrentListMap!2086 lt!183822 lt!183817 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!183816 () ListLongMap!5445)

(declare-fun lt!183821 () ListLongMap!5445)

(assert (=> b!390164 (and (= lt!183816 lt!183821) (= lt!183821 lt!183816))))

(declare-fun lt!183818 () ListLongMap!5445)

(declare-fun lt!183819 () tuple2!6532)

(declare-fun +!1033 (ListLongMap!5445 tuple2!6532) ListLongMap!5445)

(assert (=> b!390164 (= lt!183821 (+!1033 lt!183818 lt!183819))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun v!373 () V!13933)

(assert (=> b!390164 (= lt!183819 (tuple2!6533 k0!778 v!373))))

(declare-datatypes ((Unit!11948 0))(
  ( (Unit!11949) )
))
(declare-fun lt!183812 () Unit!11948)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!250 (array!23139 array!23141 (_ BitVec 32) (_ BitVec 32) V!13933 V!13933 (_ BitVec 32) (_ BitVec 64) V!13933 (_ BitVec 32) Int) Unit!11948)

(assert (=> b!390164 (= lt!183812 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!250 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!966 (array!23139 array!23141 (_ BitVec 32) (_ BitVec 32) V!13933 V!13933 (_ BitVec 32) Int) ListLongMap!5445)

(assert (=> b!390164 (= lt!183816 (getCurrentListMapNoExtraKeys!966 lt!183822 lt!183817 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!390164 (= lt!183817 (array!23142 (store (arr!11035 _values!506) i!548 (ValueCellFull!4467 v!373)) (size!11387 _values!506)))))

(assert (=> b!390164 (= lt!183818 (getCurrentListMapNoExtraKeys!966 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun mapNonEmpty!16008 () Bool)

(declare-fun mapRes!16008 () Bool)

(declare-fun tp!31610 () Bool)

(declare-fun e!236354 () Bool)

(assert (=> mapNonEmpty!16008 (= mapRes!16008 (and tp!31610 e!236354))))

(declare-fun mapRest!16008 () (Array (_ BitVec 32) ValueCell!4467))

(declare-fun mapValue!16008 () ValueCell!4467)

(declare-fun mapKey!16008 () (_ BitVec 32))

(assert (=> mapNonEmpty!16008 (= (arr!11035 _values!506) (store mapRest!16008 mapKey!16008 mapValue!16008))))

(declare-fun b!390165 () Bool)

(declare-fun res!223242 () Bool)

(assert (=> b!390165 (=> (not res!223242) (not e!236352))))

(assert (=> b!390165 (= res!223242 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11386 _keys!658))))))

(declare-fun b!390166 () Bool)

(declare-fun res!223245 () Bool)

(assert (=> b!390166 (=> (not res!223245) (not e!236352))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!390166 (= res!223245 (validKeyInArray!0 k0!778))))

(declare-fun b!390167 () Bool)

(assert (=> b!390167 (= e!236352 e!236357)))

(declare-fun res!223247 () Bool)

(assert (=> b!390167 (=> (not res!223247) (not e!236357))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23139 (_ BitVec 32)) Bool)

(assert (=> b!390167 (= res!223247 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!183822 mask!970))))

(assert (=> b!390167 (= lt!183822 (array!23140 (store (arr!11034 _keys!658) i!548 k0!778) (size!11386 _keys!658)))))

(declare-fun mapIsEmpty!16008 () Bool)

(assert (=> mapIsEmpty!16008 mapRes!16008))

(declare-fun b!390168 () Bool)

(declare-fun res!223250 () Bool)

(assert (=> b!390168 (=> (not res!223250) (not e!236352))))

(assert (=> b!390168 (= res!223250 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!390169 () Bool)

(declare-fun res!223248 () Bool)

(assert (=> b!390169 (=> (not res!223248) (not e!236352))))

(assert (=> b!390169 (= res!223248 (and (= (size!11387 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11386 _keys!658) (size!11387 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!390170 () Bool)

(declare-fun res!223244 () Bool)

(assert (=> b!390170 (=> (not res!223244) (not e!236357))))

(declare-datatypes ((List!6387 0))(
  ( (Nil!6384) (Cons!6383 (h!7239 (_ BitVec 64)) (t!11545 List!6387)) )
))
(declare-fun arrayNoDuplicates!0 (array!23139 (_ BitVec 32) List!6387) Bool)

(assert (=> b!390170 (= res!223244 (arrayNoDuplicates!0 lt!183822 #b00000000000000000000000000000000 Nil!6384))))

(declare-fun b!390171 () Bool)

(declare-fun e!236358 () Bool)

(assert (=> b!390171 (= e!236353 e!236358)))

(declare-fun res!223241 () Bool)

(assert (=> b!390171 (=> res!223241 e!236358)))

(assert (=> b!390171 (= res!223241 (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!183814 () ListLongMap!5445)

(declare-fun lt!183809 () ListLongMap!5445)

(assert (=> b!390171 (= lt!183814 lt!183809)))

(declare-fun lt!183810 () ListLongMap!5445)

(assert (=> b!390171 (= lt!183809 (+!1033 lt!183810 lt!183819))))

(declare-fun lt!183811 () Unit!11948)

(declare-fun addCommutativeForDiffKeys!336 (ListLongMap!5445 (_ BitVec 64) V!13933 (_ BitVec 64) V!13933) Unit!11948)

(assert (=> b!390171 (= lt!183811 (addCommutativeForDiffKeys!336 lt!183818 k0!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun lt!183807 () tuple2!6532)

(assert (=> b!390171 (= lt!183815 (+!1033 lt!183814 lt!183807))))

(declare-fun lt!183806 () tuple2!6532)

(assert (=> b!390171 (= lt!183814 (+!1033 lt!183821 lt!183806))))

(declare-fun lt!183820 () ListLongMap!5445)

(assert (=> b!390171 (= lt!183813 lt!183820)))

(assert (=> b!390171 (= lt!183820 (+!1033 lt!183810 lt!183807))))

(assert (=> b!390171 (= lt!183810 (+!1033 lt!183818 lt!183806))))

(assert (=> b!390171 (= lt!183815 (+!1033 (+!1033 lt!183816 lt!183806) lt!183807))))

(assert (=> b!390171 (= lt!183807 (tuple2!6533 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(assert (=> b!390171 (= lt!183806 (tuple2!6533 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!390172 () Bool)

(assert (=> b!390172 (= e!236354 tp_is_empty!9621)))

(declare-fun b!390173 () Bool)

(declare-fun res!223243 () Bool)

(assert (=> b!390173 (=> (not res!223243) (not e!236352))))

(declare-fun arrayContainsKey!0 (array!23139 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!390173 (= res!223243 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!390174 () Bool)

(assert (=> b!390174 (= e!236358 (= (+!1033 lt!183813 lt!183819) lt!183815))))

(assert (=> b!390174 (= (+!1033 lt!183809 lt!183807) (+!1033 lt!183820 lt!183819))))

(declare-fun lt!183808 () Unit!11948)

(assert (=> b!390174 (= lt!183808 (addCommutativeForDiffKeys!336 lt!183810 k0!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun res!223246 () Bool)

(assert (=> start!37936 (=> (not res!223246) (not e!236352))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37936 (= res!223246 (validMask!0 mask!970))))

(assert (=> start!37936 e!236352))

(declare-fun e!236355 () Bool)

(declare-fun array_inv!8108 (array!23141) Bool)

(assert (=> start!37936 (and (array_inv!8108 _values!506) e!236355)))

(assert (=> start!37936 tp!31611))

(assert (=> start!37936 true))

(assert (=> start!37936 tp_is_empty!9621))

(declare-fun array_inv!8109 (array!23139) Bool)

(assert (=> start!37936 (array_inv!8109 _keys!658)))

(declare-fun b!390175 () Bool)

(declare-fun res!223251 () Bool)

(assert (=> b!390175 (=> (not res!223251) (not e!236352))))

(assert (=> b!390175 (= res!223251 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6384))))

(declare-fun b!390176 () Bool)

(assert (=> b!390176 (= e!236355 (and e!236356 mapRes!16008))))

(declare-fun condMapEmpty!16008 () Bool)

(declare-fun mapDefault!16008 () ValueCell!4467)

(assert (=> b!390176 (= condMapEmpty!16008 (= (arr!11035 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4467)) mapDefault!16008)))))

(assert (= (and start!37936 res!223246) b!390169))

(assert (= (and b!390169 res!223248) b!390168))

(assert (= (and b!390168 res!223250) b!390175))

(assert (= (and b!390175 res!223251) b!390165))

(assert (= (and b!390165 res!223242) b!390166))

(assert (= (and b!390166 res!223245) b!390163))

(assert (= (and b!390163 res!223252) b!390173))

(assert (= (and b!390173 res!223243) b!390167))

(assert (= (and b!390167 res!223247) b!390170))

(assert (= (and b!390170 res!223244) b!390164))

(assert (= (and b!390164 (not res!223249)) b!390171))

(assert (= (and b!390171 (not res!223241)) b!390174))

(assert (= (and b!390176 condMapEmpty!16008) mapIsEmpty!16008))

(assert (= (and b!390176 (not condMapEmpty!16008)) mapNonEmpty!16008))

(get-info :version)

(assert (= (and mapNonEmpty!16008 ((_ is ValueCellFull!4467) mapValue!16008)) b!390172))

(assert (= (and b!390176 ((_ is ValueCellFull!4467) mapDefault!16008)) b!390162))

(assert (= start!37936 b!390176))

(declare-fun m!386461 () Bool)

(assert (=> b!390167 m!386461))

(declare-fun m!386463 () Bool)

(assert (=> b!390167 m!386463))

(declare-fun m!386465 () Bool)

(assert (=> b!390170 m!386465))

(declare-fun m!386467 () Bool)

(assert (=> b!390173 m!386467))

(declare-fun m!386469 () Bool)

(assert (=> b!390163 m!386469))

(declare-fun m!386471 () Bool)

(assert (=> b!390168 m!386471))

(declare-fun m!386473 () Bool)

(assert (=> b!390171 m!386473))

(declare-fun m!386475 () Bool)

(assert (=> b!390171 m!386475))

(assert (=> b!390171 m!386473))

(declare-fun m!386477 () Bool)

(assert (=> b!390171 m!386477))

(declare-fun m!386479 () Bool)

(assert (=> b!390171 m!386479))

(declare-fun m!386481 () Bool)

(assert (=> b!390171 m!386481))

(declare-fun m!386483 () Bool)

(assert (=> b!390171 m!386483))

(declare-fun m!386485 () Bool)

(assert (=> b!390171 m!386485))

(declare-fun m!386487 () Bool)

(assert (=> b!390171 m!386487))

(declare-fun m!386489 () Bool)

(assert (=> b!390164 m!386489))

(declare-fun m!386491 () Bool)

(assert (=> b!390164 m!386491))

(declare-fun m!386493 () Bool)

(assert (=> b!390164 m!386493))

(declare-fun m!386495 () Bool)

(assert (=> b!390164 m!386495))

(declare-fun m!386497 () Bool)

(assert (=> b!390164 m!386497))

(declare-fun m!386499 () Bool)

(assert (=> b!390164 m!386499))

(declare-fun m!386501 () Bool)

(assert (=> b!390164 m!386501))

(declare-fun m!386503 () Bool)

(assert (=> start!37936 m!386503))

(declare-fun m!386505 () Bool)

(assert (=> start!37936 m!386505))

(declare-fun m!386507 () Bool)

(assert (=> start!37936 m!386507))

(declare-fun m!386509 () Bool)

(assert (=> b!390175 m!386509))

(declare-fun m!386511 () Bool)

(assert (=> b!390166 m!386511))

(declare-fun m!386513 () Bool)

(assert (=> b!390174 m!386513))

(declare-fun m!386515 () Bool)

(assert (=> b!390174 m!386515))

(declare-fun m!386517 () Bool)

(assert (=> b!390174 m!386517))

(declare-fun m!386519 () Bool)

(assert (=> b!390174 m!386519))

(declare-fun m!386521 () Bool)

(assert (=> mapNonEmpty!16008 m!386521))

(check-sat (not b!390174) (not b!390173) (not b!390170) (not b!390166) (not b!390171) (not b!390168) b_and!16239 (not b!390167) (not b!390164) tp_is_empty!9621 (not start!37936) (not b!390175) (not mapNonEmpty!16008) (not b_next!8949))
(check-sat b_and!16239 (not b_next!8949))

; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20480 () Bool)

(assert start!20480)

(declare-fun b_free!5139 () Bool)

(declare-fun b_next!5139 () Bool)

(assert (=> start!20480 (= b_free!5139 (not b_next!5139))))

(declare-fun tp!18448 () Bool)

(declare-fun b_and!11885 () Bool)

(assert (=> start!20480 (= tp!18448 b_and!11885)))

(declare-fun b!203139 () Bool)

(declare-fun res!97531 () Bool)

(declare-fun e!133013 () Bool)

(assert (=> b!203139 (=> (not res!97531) (not e!133013))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!203139 (= res!97531 (validKeyInArray!0 k0!843))))

(declare-fun b!203140 () Bool)

(declare-fun e!133009 () Bool)

(declare-fun tp_is_empty!4995 () Bool)

(assert (=> b!203140 (= e!133009 tp_is_empty!4995)))

(declare-fun b!203141 () Bool)

(declare-fun e!133012 () Bool)

(declare-fun e!133010 () Bool)

(declare-fun mapRes!8561 () Bool)

(assert (=> b!203141 (= e!133012 (and e!133010 mapRes!8561))))

(declare-fun condMapEmpty!8561 () Bool)

(declare-datatypes ((V!6307 0))(
  ( (V!6308 (val!2542 Int)) )
))
(declare-datatypes ((ValueCell!2154 0))(
  ( (ValueCellFull!2154 (v!4512 V!6307)) (EmptyCell!2154) )
))
(declare-datatypes ((array!9215 0))(
  ( (array!9216 (arr!4358 (Array (_ BitVec 32) ValueCell!2154)) (size!4683 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9215)

(declare-fun mapDefault!8561 () ValueCell!2154)

(assert (=> b!203141 (= condMapEmpty!8561 (= (arr!4358 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2154)) mapDefault!8561)))))

(declare-fun b!203142 () Bool)

(declare-fun res!97532 () Bool)

(assert (=> b!203142 (=> (not res!97532) (not e!133013))))

(declare-datatypes ((array!9217 0))(
  ( (array!9218 (arr!4359 (Array (_ BitVec 32) (_ BitVec 64))) (size!4684 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9217)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!203142 (= res!97532 (and (= (size!4683 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4684 _keys!825) (size!4683 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!203143 () Bool)

(declare-fun res!97537 () Bool)

(assert (=> b!203143 (=> (not res!97537) (not e!133013))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!203143 (= res!97537 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4684 _keys!825))))))

(declare-fun b!203144 () Bool)

(declare-fun res!97529 () Bool)

(assert (=> b!203144 (=> (not res!97529) (not e!133013))))

(assert (=> b!203144 (= res!97529 (= (select (arr!4359 _keys!825) i!601) k0!843))))

(declare-fun b!203145 () Bool)

(assert (=> b!203145 (= e!133010 tp_is_empty!4995)))

(declare-fun b!203146 () Bool)

(declare-fun e!133011 () Bool)

(declare-fun e!133007 () Bool)

(assert (=> b!203146 (= e!133011 e!133007)))

(declare-fun res!97535 () Bool)

(assert (=> b!203146 (=> res!97535 e!133007)))

(assert (=> b!203146 (= res!97535 (= k0!843 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!3856 0))(
  ( (tuple2!3857 (_1!1939 (_ BitVec 64)) (_2!1939 V!6307)) )
))
(declare-datatypes ((List!2760 0))(
  ( (Nil!2757) (Cons!2756 (h!3398 tuple2!3856) (t!7691 List!2760)) )
))
(declare-datatypes ((ListLongMap!2769 0))(
  ( (ListLongMap!2770 (toList!1400 List!2760)) )
))
(declare-fun lt!102326 () ListLongMap!2769)

(declare-fun lt!102327 () ListLongMap!2769)

(assert (=> b!203146 (= lt!102326 lt!102327)))

(declare-fun lt!102316 () ListLongMap!2769)

(declare-fun lt!102322 () tuple2!3856)

(declare-fun +!427 (ListLongMap!2769 tuple2!3856) ListLongMap!2769)

(assert (=> b!203146 (= lt!102327 (+!427 lt!102316 lt!102322))))

(declare-fun lt!102320 () ListLongMap!2769)

(declare-fun lt!102323 () ListLongMap!2769)

(assert (=> b!203146 (= lt!102320 lt!102323)))

(declare-fun lt!102319 () ListLongMap!2769)

(assert (=> b!203146 (= lt!102323 (+!427 lt!102319 lt!102322))))

(declare-fun lt!102325 () ListLongMap!2769)

(assert (=> b!203146 (= lt!102326 (+!427 lt!102325 lt!102322))))

(declare-fun zeroValue!615 () V!6307)

(assert (=> b!203146 (= lt!102322 (tuple2!3857 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!203147 () Bool)

(assert (=> b!203147 (= e!133007 true)))

(declare-fun lt!102317 () tuple2!3856)

(assert (=> b!203147 (= lt!102327 (+!427 lt!102323 lt!102317))))

(declare-fun v!520 () V!6307)

(declare-datatypes ((Unit!6148 0))(
  ( (Unit!6149) )
))
(declare-fun lt!102324 () Unit!6148)

(declare-fun addCommutativeForDiffKeys!142 (ListLongMap!2769 (_ BitVec 64) V!6307 (_ BitVec 64) V!6307) Unit!6148)

(assert (=> b!203147 (= lt!102324 (addCommutativeForDiffKeys!142 lt!102319 k0!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!203148 () Bool)

(declare-fun res!97534 () Bool)

(assert (=> b!203148 (=> (not res!97534) (not e!133013))))

(declare-datatypes ((List!2761 0))(
  ( (Nil!2758) (Cons!2757 (h!3399 (_ BitVec 64)) (t!7692 List!2761)) )
))
(declare-fun arrayNoDuplicates!0 (array!9217 (_ BitVec 32) List!2761) Bool)

(assert (=> b!203148 (= res!97534 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2758))))

(declare-fun b!203149 () Bool)

(declare-fun res!97536 () Bool)

(assert (=> b!203149 (=> (not res!97536) (not e!133013))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9217 (_ BitVec 32)) Bool)

(assert (=> b!203149 (= res!97536 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun res!97530 () Bool)

(assert (=> start!20480 (=> (not res!97530) (not e!133013))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20480 (= res!97530 (validMask!0 mask!1149))))

(assert (=> start!20480 e!133013))

(declare-fun array_inv!2881 (array!9215) Bool)

(assert (=> start!20480 (and (array_inv!2881 _values!649) e!133012)))

(assert (=> start!20480 true))

(assert (=> start!20480 tp_is_empty!4995))

(declare-fun array_inv!2882 (array!9217) Bool)

(assert (=> start!20480 (array_inv!2882 _keys!825)))

(assert (=> start!20480 tp!18448))

(declare-fun mapNonEmpty!8561 () Bool)

(declare-fun tp!18449 () Bool)

(assert (=> mapNonEmpty!8561 (= mapRes!8561 (and tp!18449 e!133009))))

(declare-fun mapValue!8561 () ValueCell!2154)

(declare-fun mapKey!8561 () (_ BitVec 32))

(declare-fun mapRest!8561 () (Array (_ BitVec 32) ValueCell!2154))

(assert (=> mapNonEmpty!8561 (= (arr!4358 _values!649) (store mapRest!8561 mapKey!8561 mapValue!8561))))

(declare-fun mapIsEmpty!8561 () Bool)

(assert (=> mapIsEmpty!8561 mapRes!8561))

(declare-fun b!203150 () Bool)

(assert (=> b!203150 (= e!133013 (not e!133011))))

(declare-fun res!97533 () Bool)

(assert (=> b!203150 (=> res!97533 e!133011)))

(assert (=> b!203150 (= res!97533 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6307)

(declare-fun getCurrentListMap!977 (array!9217 array!9215 (_ BitVec 32) (_ BitVec 32) V!6307 V!6307 (_ BitVec 32) Int) ListLongMap!2769)

(assert (=> b!203150 (= lt!102320 (getCurrentListMap!977 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!102321 () array!9215)

(assert (=> b!203150 (= lt!102326 (getCurrentListMap!977 _keys!825 lt!102321 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!203150 (and (= lt!102325 lt!102316) (= lt!102316 lt!102325))))

(assert (=> b!203150 (= lt!102316 (+!427 lt!102319 lt!102317))))

(assert (=> b!203150 (= lt!102317 (tuple2!3857 k0!843 v!520))))

(declare-fun lt!102318 () Unit!6148)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!90 (array!9217 array!9215 (_ BitVec 32) (_ BitVec 32) V!6307 V!6307 (_ BitVec 32) (_ BitVec 64) V!6307 (_ BitVec 32) Int) Unit!6148)

(assert (=> b!203150 (= lt!102318 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!90 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!351 (array!9217 array!9215 (_ BitVec 32) (_ BitVec 32) V!6307 V!6307 (_ BitVec 32) Int) ListLongMap!2769)

(assert (=> b!203150 (= lt!102325 (getCurrentListMapNoExtraKeys!351 _keys!825 lt!102321 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!203150 (= lt!102321 (array!9216 (store (arr!4358 _values!649) i!601 (ValueCellFull!2154 v!520)) (size!4683 _values!649)))))

(assert (=> b!203150 (= lt!102319 (getCurrentListMapNoExtraKeys!351 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (= (and start!20480 res!97530) b!203142))

(assert (= (and b!203142 res!97532) b!203149))

(assert (= (and b!203149 res!97536) b!203148))

(assert (= (and b!203148 res!97534) b!203143))

(assert (= (and b!203143 res!97537) b!203139))

(assert (= (and b!203139 res!97531) b!203144))

(assert (= (and b!203144 res!97529) b!203150))

(assert (= (and b!203150 (not res!97533)) b!203146))

(assert (= (and b!203146 (not res!97535)) b!203147))

(assert (= (and b!203141 condMapEmpty!8561) mapIsEmpty!8561))

(assert (= (and b!203141 (not condMapEmpty!8561)) mapNonEmpty!8561))

(get-info :version)

(assert (= (and mapNonEmpty!8561 ((_ is ValueCellFull!2154) mapValue!8561)) b!203140))

(assert (= (and b!203141 ((_ is ValueCellFull!2154) mapDefault!8561)) b!203145))

(assert (= start!20480 b!203141))

(declare-fun m!230531 () Bool)

(assert (=> b!203146 m!230531))

(declare-fun m!230533 () Bool)

(assert (=> b!203146 m!230533))

(declare-fun m!230535 () Bool)

(assert (=> b!203146 m!230535))

(declare-fun m!230537 () Bool)

(assert (=> b!203139 m!230537))

(declare-fun m!230539 () Bool)

(assert (=> mapNonEmpty!8561 m!230539))

(declare-fun m!230541 () Bool)

(assert (=> b!203149 m!230541))

(declare-fun m!230543 () Bool)

(assert (=> b!203147 m!230543))

(declare-fun m!230545 () Bool)

(assert (=> b!203147 m!230545))

(declare-fun m!230547 () Bool)

(assert (=> b!203148 m!230547))

(declare-fun m!230549 () Bool)

(assert (=> b!203144 m!230549))

(declare-fun m!230551 () Bool)

(assert (=> b!203150 m!230551))

(declare-fun m!230553 () Bool)

(assert (=> b!203150 m!230553))

(declare-fun m!230555 () Bool)

(assert (=> b!203150 m!230555))

(declare-fun m!230557 () Bool)

(assert (=> b!203150 m!230557))

(declare-fun m!230559 () Bool)

(assert (=> b!203150 m!230559))

(declare-fun m!230561 () Bool)

(assert (=> b!203150 m!230561))

(declare-fun m!230563 () Bool)

(assert (=> b!203150 m!230563))

(declare-fun m!230565 () Bool)

(assert (=> start!20480 m!230565))

(declare-fun m!230567 () Bool)

(assert (=> start!20480 m!230567))

(declare-fun m!230569 () Bool)

(assert (=> start!20480 m!230569))

(check-sat tp_is_empty!4995 b_and!11885 (not b!203148) (not b!203149) (not b!203139) (not b_next!5139) (not start!20480) (not b!203150) (not b!203147) (not b!203146) (not mapNonEmpty!8561))
(check-sat b_and!11885 (not b_next!5139))

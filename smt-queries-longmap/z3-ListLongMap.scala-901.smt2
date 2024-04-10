; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20504 () Bool)

(assert start!20504)

(declare-fun b_free!5163 () Bool)

(declare-fun b_next!5163 () Bool)

(assert (=> start!20504 (= b_free!5163 (not b_next!5163))))

(declare-fun tp!18520 () Bool)

(declare-fun b_and!11909 () Bool)

(assert (=> start!20504 (= tp!18520 b_and!11909)))

(declare-fun b!203571 () Bool)

(declare-fun res!97856 () Bool)

(declare-fun e!133262 () Bool)

(assert (=> b!203571 (=> (not res!97856) (not e!133262))))

(declare-datatypes ((array!9261 0))(
  ( (array!9262 (arr!4381 (Array (_ BitVec 32) (_ BitVec 64))) (size!4706 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9261)

(declare-datatypes ((List!2778 0))(
  ( (Nil!2775) (Cons!2774 (h!3416 (_ BitVec 64)) (t!7709 List!2778)) )
))
(declare-fun arrayNoDuplicates!0 (array!9261 (_ BitVec 32) List!2778) Bool)

(assert (=> b!203571 (= res!97856 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2775))))

(declare-fun mapIsEmpty!8597 () Bool)

(declare-fun mapRes!8597 () Bool)

(assert (=> mapIsEmpty!8597 mapRes!8597))

(declare-fun b!203572 () Bool)

(declare-fun res!97857 () Bool)

(assert (=> b!203572 (=> (not res!97857) (not e!133262))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9261 (_ BitVec 32)) Bool)

(assert (=> b!203572 (= res!97857 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!203573 () Bool)

(declare-fun e!133260 () Bool)

(assert (=> b!203573 (= e!133262 (not e!133260))))

(declare-fun res!97858 () Bool)

(assert (=> b!203573 (=> res!97858 e!133260)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!203573 (= res!97858 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!6339 0))(
  ( (V!6340 (val!2554 Int)) )
))
(declare-datatypes ((ValueCell!2166 0))(
  ( (ValueCellFull!2166 (v!4524 V!6339)) (EmptyCell!2166) )
))
(declare-datatypes ((array!9263 0))(
  ( (array!9264 (arr!4382 (Array (_ BitVec 32) ValueCell!2166)) (size!4707 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9263)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6339)

(declare-fun zeroValue!615 () V!6339)

(declare-datatypes ((tuple2!3876 0))(
  ( (tuple2!3877 (_1!1949 (_ BitVec 64)) (_2!1949 V!6339)) )
))
(declare-datatypes ((List!2779 0))(
  ( (Nil!2776) (Cons!2775 (h!3417 tuple2!3876) (t!7710 List!2779)) )
))
(declare-datatypes ((ListLongMap!2789 0))(
  ( (ListLongMap!2790 (toList!1410 List!2779)) )
))
(declare-fun lt!102751 () ListLongMap!2789)

(declare-fun getCurrentListMap!985 (array!9261 array!9263 (_ BitVec 32) (_ BitVec 32) V!6339 V!6339 (_ BitVec 32) Int) ListLongMap!2789)

(assert (=> b!203573 (= lt!102751 (getCurrentListMap!985 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!102748 () array!9263)

(declare-fun lt!102750 () ListLongMap!2789)

(assert (=> b!203573 (= lt!102750 (getCurrentListMap!985 _keys!825 lt!102748 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!102759 () ListLongMap!2789)

(declare-fun lt!102755 () ListLongMap!2789)

(assert (=> b!203573 (and (= lt!102759 lt!102755) (= lt!102755 lt!102759))))

(declare-fun lt!102756 () ListLongMap!2789)

(declare-fun lt!102752 () tuple2!3876)

(declare-fun +!437 (ListLongMap!2789 tuple2!3876) ListLongMap!2789)

(assert (=> b!203573 (= lt!102755 (+!437 lt!102756 lt!102752))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun v!520 () V!6339)

(assert (=> b!203573 (= lt!102752 (tuple2!3877 k0!843 v!520))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((Unit!6168 0))(
  ( (Unit!6169) )
))
(declare-fun lt!102757 () Unit!6168)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!98 (array!9261 array!9263 (_ BitVec 32) (_ BitVec 32) V!6339 V!6339 (_ BitVec 32) (_ BitVec 64) V!6339 (_ BitVec 32) Int) Unit!6168)

(assert (=> b!203573 (= lt!102757 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!98 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!359 (array!9261 array!9263 (_ BitVec 32) (_ BitVec 32) V!6339 V!6339 (_ BitVec 32) Int) ListLongMap!2789)

(assert (=> b!203573 (= lt!102759 (getCurrentListMapNoExtraKeys!359 _keys!825 lt!102748 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!203573 (= lt!102748 (array!9264 (store (arr!4382 _values!649) i!601 (ValueCellFull!2166 v!520)) (size!4707 _values!649)))))

(assert (=> b!203573 (= lt!102756 (getCurrentListMapNoExtraKeys!359 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!203574 () Bool)

(declare-fun res!97861 () Bool)

(assert (=> b!203574 (=> (not res!97861) (not e!133262))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!203574 (= res!97861 (validKeyInArray!0 k0!843))))

(declare-fun b!203575 () Bool)

(declare-fun res!97853 () Bool)

(assert (=> b!203575 (=> (not res!97853) (not e!133262))))

(assert (=> b!203575 (= res!97853 (and (= (size!4707 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4706 _keys!825) (size!4707 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!203576 () Bool)

(declare-fun e!133265 () Bool)

(declare-fun e!133264 () Bool)

(assert (=> b!203576 (= e!133265 (and e!133264 mapRes!8597))))

(declare-fun condMapEmpty!8597 () Bool)

(declare-fun mapDefault!8597 () ValueCell!2166)

(assert (=> b!203576 (= condMapEmpty!8597 (= (arr!4382 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2166)) mapDefault!8597)))))

(declare-fun b!203577 () Bool)

(declare-fun res!97854 () Bool)

(assert (=> b!203577 (=> (not res!97854) (not e!133262))))

(assert (=> b!203577 (= res!97854 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4706 _keys!825))))))

(declare-fun b!203578 () Bool)

(declare-fun e!133259 () Bool)

(assert (=> b!203578 (= e!133260 e!133259)))

(declare-fun res!97859 () Bool)

(assert (=> b!203578 (=> res!97859 e!133259)))

(assert (=> b!203578 (= res!97859 (= k0!843 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!102754 () ListLongMap!2789)

(assert (=> b!203578 (= lt!102750 lt!102754)))

(declare-fun lt!102749 () tuple2!3876)

(assert (=> b!203578 (= lt!102754 (+!437 lt!102755 lt!102749))))

(declare-fun lt!102758 () ListLongMap!2789)

(assert (=> b!203578 (= lt!102751 lt!102758)))

(assert (=> b!203578 (= lt!102758 (+!437 lt!102756 lt!102749))))

(assert (=> b!203578 (= lt!102750 (+!437 lt!102759 lt!102749))))

(assert (=> b!203578 (= lt!102749 (tuple2!3877 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!203579 () Bool)

(declare-fun res!97855 () Bool)

(assert (=> b!203579 (=> (not res!97855) (not e!133262))))

(assert (=> b!203579 (= res!97855 (= (select (arr!4381 _keys!825) i!601) k0!843))))

(declare-fun b!203580 () Bool)

(declare-fun tp_is_empty!5019 () Bool)

(assert (=> b!203580 (= e!133264 tp_is_empty!5019)))

(declare-fun b!203581 () Bool)

(assert (=> b!203581 (= e!133259 true)))

(assert (=> b!203581 (= lt!102754 (+!437 lt!102758 lt!102752))))

(declare-fun lt!102753 () Unit!6168)

(declare-fun addCommutativeForDiffKeys!149 (ListLongMap!2789 (_ BitVec 64) V!6339 (_ BitVec 64) V!6339) Unit!6168)

(assert (=> b!203581 (= lt!102753 (addCommutativeForDiffKeys!149 lt!102756 k0!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun res!97860 () Bool)

(assert (=> start!20504 (=> (not res!97860) (not e!133262))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20504 (= res!97860 (validMask!0 mask!1149))))

(assert (=> start!20504 e!133262))

(declare-fun array_inv!2895 (array!9263) Bool)

(assert (=> start!20504 (and (array_inv!2895 _values!649) e!133265)))

(assert (=> start!20504 true))

(assert (=> start!20504 tp_is_empty!5019))

(declare-fun array_inv!2896 (array!9261) Bool)

(assert (=> start!20504 (array_inv!2896 _keys!825)))

(assert (=> start!20504 tp!18520))

(declare-fun b!203582 () Bool)

(declare-fun e!133263 () Bool)

(assert (=> b!203582 (= e!133263 tp_is_empty!5019)))

(declare-fun mapNonEmpty!8597 () Bool)

(declare-fun tp!18521 () Bool)

(assert (=> mapNonEmpty!8597 (= mapRes!8597 (and tp!18521 e!133263))))

(declare-fun mapValue!8597 () ValueCell!2166)

(declare-fun mapRest!8597 () (Array (_ BitVec 32) ValueCell!2166))

(declare-fun mapKey!8597 () (_ BitVec 32))

(assert (=> mapNonEmpty!8597 (= (arr!4382 _values!649) (store mapRest!8597 mapKey!8597 mapValue!8597))))

(assert (= (and start!20504 res!97860) b!203575))

(assert (= (and b!203575 res!97853) b!203572))

(assert (= (and b!203572 res!97857) b!203571))

(assert (= (and b!203571 res!97856) b!203577))

(assert (= (and b!203577 res!97854) b!203574))

(assert (= (and b!203574 res!97861) b!203579))

(assert (= (and b!203579 res!97855) b!203573))

(assert (= (and b!203573 (not res!97858)) b!203578))

(assert (= (and b!203578 (not res!97859)) b!203581))

(assert (= (and b!203576 condMapEmpty!8597) mapIsEmpty!8597))

(assert (= (and b!203576 (not condMapEmpty!8597)) mapNonEmpty!8597))

(get-info :version)

(assert (= (and mapNonEmpty!8597 ((_ is ValueCellFull!2166) mapValue!8597)) b!203582))

(assert (= (and b!203576 ((_ is ValueCellFull!2166) mapDefault!8597)) b!203580))

(assert (= start!20504 b!203576))

(declare-fun m!231011 () Bool)

(assert (=> b!203574 m!231011))

(declare-fun m!231013 () Bool)

(assert (=> b!203578 m!231013))

(declare-fun m!231015 () Bool)

(assert (=> b!203578 m!231015))

(declare-fun m!231017 () Bool)

(assert (=> b!203578 m!231017))

(declare-fun m!231019 () Bool)

(assert (=> start!20504 m!231019))

(declare-fun m!231021 () Bool)

(assert (=> start!20504 m!231021))

(declare-fun m!231023 () Bool)

(assert (=> start!20504 m!231023))

(declare-fun m!231025 () Bool)

(assert (=> b!203581 m!231025))

(declare-fun m!231027 () Bool)

(assert (=> b!203581 m!231027))

(declare-fun m!231029 () Bool)

(assert (=> b!203571 m!231029))

(declare-fun m!231031 () Bool)

(assert (=> mapNonEmpty!8597 m!231031))

(declare-fun m!231033 () Bool)

(assert (=> b!203573 m!231033))

(declare-fun m!231035 () Bool)

(assert (=> b!203573 m!231035))

(declare-fun m!231037 () Bool)

(assert (=> b!203573 m!231037))

(declare-fun m!231039 () Bool)

(assert (=> b!203573 m!231039))

(declare-fun m!231041 () Bool)

(assert (=> b!203573 m!231041))

(declare-fun m!231043 () Bool)

(assert (=> b!203573 m!231043))

(declare-fun m!231045 () Bool)

(assert (=> b!203573 m!231045))

(declare-fun m!231047 () Bool)

(assert (=> b!203579 m!231047))

(declare-fun m!231049 () Bool)

(assert (=> b!203572 m!231049))

(check-sat b_and!11909 (not b!203572) (not b_next!5163) (not mapNonEmpty!8597) (not start!20504) (not b!203573) (not b!203574) (not b!203571) tp_is_empty!5019 (not b!203581) (not b!203578))
(check-sat b_and!11909 (not b_next!5163))

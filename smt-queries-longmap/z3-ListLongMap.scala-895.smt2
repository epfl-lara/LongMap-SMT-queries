; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20468 () Bool)

(assert start!20468)

(declare-fun b_free!5127 () Bool)

(declare-fun b_next!5127 () Bool)

(assert (=> start!20468 (= b_free!5127 (not b_next!5127))))

(declare-fun tp!18413 () Bool)

(declare-fun b_and!11873 () Bool)

(assert (=> start!20468 (= tp!18413 b_and!11873)))

(declare-fun b!202923 () Bool)

(declare-fun e!132884 () Bool)

(declare-fun e!132883 () Bool)

(assert (=> b!202923 (= e!132884 e!132883)))

(declare-fun res!97369 () Bool)

(assert (=> b!202923 (=> res!97369 e!132883)))

(declare-fun k0!843 () (_ BitVec 64))

(assert (=> b!202923 (= res!97369 (= k0!843 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((V!6291 0))(
  ( (V!6292 (val!2536 Int)) )
))
(declare-datatypes ((tuple2!3844 0))(
  ( (tuple2!3845 (_1!1933 (_ BitVec 64)) (_2!1933 V!6291)) )
))
(declare-datatypes ((List!2750 0))(
  ( (Nil!2747) (Cons!2746 (h!3388 tuple2!3844) (t!7681 List!2750)) )
))
(declare-datatypes ((ListLongMap!2757 0))(
  ( (ListLongMap!2758 (toList!1394 List!2750)) )
))
(declare-fun lt!102109 () ListLongMap!2757)

(declare-fun lt!102110 () ListLongMap!2757)

(assert (=> b!202923 (= lt!102109 lt!102110)))

(declare-fun lt!102104 () ListLongMap!2757)

(declare-fun lt!102108 () tuple2!3844)

(declare-fun +!421 (ListLongMap!2757 tuple2!3844) ListLongMap!2757)

(assert (=> b!202923 (= lt!102110 (+!421 lt!102104 lt!102108))))

(declare-fun lt!102106 () ListLongMap!2757)

(declare-fun lt!102102 () ListLongMap!2757)

(assert (=> b!202923 (= lt!102106 lt!102102)))

(declare-fun lt!102101 () ListLongMap!2757)

(assert (=> b!202923 (= lt!102102 (+!421 lt!102101 lt!102108))))

(declare-fun lt!102105 () ListLongMap!2757)

(assert (=> b!202923 (= lt!102109 (+!421 lt!102105 lt!102108))))

(declare-fun zeroValue!615 () V!6291)

(assert (=> b!202923 (= lt!102108 (tuple2!3845 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun mapNonEmpty!8543 () Bool)

(declare-fun mapRes!8543 () Bool)

(declare-fun tp!18412 () Bool)

(declare-fun e!132885 () Bool)

(assert (=> mapNonEmpty!8543 (= mapRes!8543 (and tp!18412 e!132885))))

(declare-datatypes ((ValueCell!2148 0))(
  ( (ValueCellFull!2148 (v!4506 V!6291)) (EmptyCell!2148) )
))
(declare-fun mapRest!8543 () (Array (_ BitVec 32) ValueCell!2148))

(declare-datatypes ((array!9191 0))(
  ( (array!9192 (arr!4346 (Array (_ BitVec 32) ValueCell!2148)) (size!4671 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9191)

(declare-fun mapValue!8543 () ValueCell!2148)

(declare-fun mapKey!8543 () (_ BitVec 32))

(assert (=> mapNonEmpty!8543 (= (arr!4346 _values!649) (store mapRest!8543 mapKey!8543 mapValue!8543))))

(declare-fun b!202924 () Bool)

(declare-fun res!97375 () Bool)

(declare-fun e!132882 () Bool)

(assert (=> b!202924 (=> (not res!97375) (not e!132882))))

(declare-datatypes ((array!9193 0))(
  ( (array!9194 (arr!4347 (Array (_ BitVec 32) (_ BitVec 64))) (size!4672 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9193)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9193 (_ BitVec 32)) Bool)

(assert (=> b!202924 (= res!97375 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun mapIsEmpty!8543 () Bool)

(assert (=> mapIsEmpty!8543 mapRes!8543))

(declare-fun b!202925 () Bool)

(declare-fun e!132886 () Bool)

(declare-fun e!132881 () Bool)

(assert (=> b!202925 (= e!132886 (and e!132881 mapRes!8543))))

(declare-fun condMapEmpty!8543 () Bool)

(declare-fun mapDefault!8543 () ValueCell!2148)

(assert (=> b!202925 (= condMapEmpty!8543 (= (arr!4346 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2148)) mapDefault!8543)))))

(declare-fun b!202926 () Bool)

(declare-fun tp_is_empty!4983 () Bool)

(assert (=> b!202926 (= e!132885 tp_is_empty!4983)))

(declare-fun b!202927 () Bool)

(declare-fun res!97372 () Bool)

(assert (=> b!202927 (=> (not res!97372) (not e!132882))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!202927 (= res!97372 (validKeyInArray!0 k0!843))))

(declare-fun b!202929 () Bool)

(declare-fun res!97371 () Bool)

(assert (=> b!202929 (=> (not res!97371) (not e!132882))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!202929 (= res!97371 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4672 _keys!825))))))

(declare-fun b!202930 () Bool)

(declare-fun res!97370 () Bool)

(assert (=> b!202930 (=> (not res!97370) (not e!132882))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!202930 (= res!97370 (and (= (size!4671 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4672 _keys!825) (size!4671 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!202931 () Bool)

(assert (=> b!202931 (= e!132881 tp_is_empty!4983)))

(declare-fun b!202932 () Bool)

(declare-fun res!97373 () Bool)

(assert (=> b!202932 (=> (not res!97373) (not e!132882))))

(assert (=> b!202932 (= res!97373 (= (select (arr!4347 _keys!825) i!601) k0!843))))

(declare-fun b!202933 () Bool)

(assert (=> b!202933 (= e!132882 (not e!132884))))

(declare-fun res!97374 () Bool)

(assert (=> b!202933 (=> res!97374 e!132884)))

(assert (=> b!202933 (= res!97374 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6291)

(declare-fun getCurrentListMap!973 (array!9193 array!9191 (_ BitVec 32) (_ BitVec 32) V!6291 V!6291 (_ BitVec 32) Int) ListLongMap!2757)

(assert (=> b!202933 (= lt!102106 (getCurrentListMap!973 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!102107 () array!9191)

(assert (=> b!202933 (= lt!102109 (getCurrentListMap!973 _keys!825 lt!102107 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!202933 (and (= lt!102105 lt!102104) (= lt!102104 lt!102105))))

(declare-fun lt!102111 () tuple2!3844)

(assert (=> b!202933 (= lt!102104 (+!421 lt!102101 lt!102111))))

(declare-fun v!520 () V!6291)

(assert (=> b!202933 (= lt!102111 (tuple2!3845 k0!843 v!520))))

(declare-datatypes ((Unit!6136 0))(
  ( (Unit!6137) )
))
(declare-fun lt!102100 () Unit!6136)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!86 (array!9193 array!9191 (_ BitVec 32) (_ BitVec 32) V!6291 V!6291 (_ BitVec 32) (_ BitVec 64) V!6291 (_ BitVec 32) Int) Unit!6136)

(assert (=> b!202933 (= lt!102100 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!86 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!347 (array!9193 array!9191 (_ BitVec 32) (_ BitVec 32) V!6291 V!6291 (_ BitVec 32) Int) ListLongMap!2757)

(assert (=> b!202933 (= lt!102105 (getCurrentListMapNoExtraKeys!347 _keys!825 lt!102107 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!202933 (= lt!102107 (array!9192 (store (arr!4346 _values!649) i!601 (ValueCellFull!2148 v!520)) (size!4671 _values!649)))))

(assert (=> b!202933 (= lt!102101 (getCurrentListMapNoExtraKeys!347 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!202934 () Bool)

(assert (=> b!202934 (= e!132883 true)))

(assert (=> b!202934 (= lt!102110 (+!421 lt!102102 lt!102111))))

(declare-fun lt!102103 () Unit!6136)

(declare-fun addCommutativeForDiffKeys!137 (ListLongMap!2757 (_ BitVec 64) V!6291 (_ BitVec 64) V!6291) Unit!6136)

(assert (=> b!202934 (= lt!102103 (addCommutativeForDiffKeys!137 lt!102101 k0!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun res!97367 () Bool)

(assert (=> start!20468 (=> (not res!97367) (not e!132882))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20468 (= res!97367 (validMask!0 mask!1149))))

(assert (=> start!20468 e!132882))

(declare-fun array_inv!2869 (array!9191) Bool)

(assert (=> start!20468 (and (array_inv!2869 _values!649) e!132886)))

(assert (=> start!20468 true))

(assert (=> start!20468 tp_is_empty!4983))

(declare-fun array_inv!2870 (array!9193) Bool)

(assert (=> start!20468 (array_inv!2870 _keys!825)))

(assert (=> start!20468 tp!18413))

(declare-fun b!202928 () Bool)

(declare-fun res!97368 () Bool)

(assert (=> b!202928 (=> (not res!97368) (not e!132882))))

(declare-datatypes ((List!2751 0))(
  ( (Nil!2748) (Cons!2747 (h!3389 (_ BitVec 64)) (t!7682 List!2751)) )
))
(declare-fun arrayNoDuplicates!0 (array!9193 (_ BitVec 32) List!2751) Bool)

(assert (=> b!202928 (= res!97368 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2748))))

(assert (= (and start!20468 res!97367) b!202930))

(assert (= (and b!202930 res!97370) b!202924))

(assert (= (and b!202924 res!97375) b!202928))

(assert (= (and b!202928 res!97368) b!202929))

(assert (= (and b!202929 res!97371) b!202927))

(assert (= (and b!202927 res!97372) b!202932))

(assert (= (and b!202932 res!97373) b!202933))

(assert (= (and b!202933 (not res!97374)) b!202923))

(assert (= (and b!202923 (not res!97369)) b!202934))

(assert (= (and b!202925 condMapEmpty!8543) mapIsEmpty!8543))

(assert (= (and b!202925 (not condMapEmpty!8543)) mapNonEmpty!8543))

(get-info :version)

(assert (= (and mapNonEmpty!8543 ((_ is ValueCellFull!2148) mapValue!8543)) b!202926))

(assert (= (and b!202925 ((_ is ValueCellFull!2148) mapDefault!8543)) b!202931))

(assert (= start!20468 b!202925))

(declare-fun m!230291 () Bool)

(assert (=> start!20468 m!230291))

(declare-fun m!230293 () Bool)

(assert (=> start!20468 m!230293))

(declare-fun m!230295 () Bool)

(assert (=> start!20468 m!230295))

(declare-fun m!230297 () Bool)

(assert (=> b!202934 m!230297))

(declare-fun m!230299 () Bool)

(assert (=> b!202934 m!230299))

(declare-fun m!230301 () Bool)

(assert (=> mapNonEmpty!8543 m!230301))

(declare-fun m!230303 () Bool)

(assert (=> b!202923 m!230303))

(declare-fun m!230305 () Bool)

(assert (=> b!202923 m!230305))

(declare-fun m!230307 () Bool)

(assert (=> b!202923 m!230307))

(declare-fun m!230309 () Bool)

(assert (=> b!202927 m!230309))

(declare-fun m!230311 () Bool)

(assert (=> b!202933 m!230311))

(declare-fun m!230313 () Bool)

(assert (=> b!202933 m!230313))

(declare-fun m!230315 () Bool)

(assert (=> b!202933 m!230315))

(declare-fun m!230317 () Bool)

(assert (=> b!202933 m!230317))

(declare-fun m!230319 () Bool)

(assert (=> b!202933 m!230319))

(declare-fun m!230321 () Bool)

(assert (=> b!202933 m!230321))

(declare-fun m!230323 () Bool)

(assert (=> b!202933 m!230323))

(declare-fun m!230325 () Bool)

(assert (=> b!202924 m!230325))

(declare-fun m!230327 () Bool)

(assert (=> b!202932 m!230327))

(declare-fun m!230329 () Bool)

(assert (=> b!202928 m!230329))

(check-sat (not b!202927) (not b!202934) b_and!11873 (not b!202933) (not mapNonEmpty!8543) (not b!202923) (not b!202928) (not start!20468) (not b_next!5127) tp_is_empty!4983 (not b!202924))
(check-sat b_and!11873 (not b_next!5127))

; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39230 () Bool)

(assert start!39230)

(declare-fun b_free!9511 () Bool)

(declare-fun b_next!9511 () Bool)

(assert (=> start!39230 (= b_free!9511 (not b_next!9511))))

(declare-fun tp!34062 () Bool)

(declare-fun b_and!16911 () Bool)

(assert (=> start!39230 (= tp!34062 b_and!16911)))

(declare-fun b!414313 () Bool)

(declare-fun res!240923 () Bool)

(declare-fun e!247619 () Bool)

(assert (=> b!414313 (=> (not res!240923) (not e!247619))))

(declare-datatypes ((array!25188 0))(
  ( (array!25189 (arr!12043 (Array (_ BitVec 32) (_ BitVec 64))) (size!12395 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25188)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!414313 (= res!240923 (or (= (select (arr!12043 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12043 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!17616 () Bool)

(declare-fun mapRes!17616 () Bool)

(declare-fun tp!34061 () Bool)

(declare-fun e!247623 () Bool)

(assert (=> mapNonEmpty!17616 (= mapRes!17616 (and tp!34061 e!247623))))

(declare-datatypes ((V!15323 0))(
  ( (V!15324 (val!5376 Int)) )
))
(declare-datatypes ((ValueCell!4988 0))(
  ( (ValueCellFull!4988 (v!7624 V!15323)) (EmptyCell!4988) )
))
(declare-fun mapValue!17616 () ValueCell!4988)

(declare-datatypes ((array!25190 0))(
  ( (array!25191 (arr!12044 (Array (_ BitVec 32) ValueCell!4988)) (size!12396 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25190)

(declare-fun mapKey!17616 () (_ BitVec 32))

(declare-fun mapRest!17616 () (Array (_ BitVec 32) ValueCell!4988))

(assert (=> mapNonEmpty!17616 (= (arr!12044 _values!549) (store mapRest!17616 mapKey!17616 mapValue!17616))))

(declare-fun b!414314 () Bool)

(declare-fun e!247621 () Bool)

(assert (=> b!414314 (= e!247621 true)))

(declare-datatypes ((tuple2!6866 0))(
  ( (tuple2!6867 (_1!3444 (_ BitVec 64)) (_2!3444 V!15323)) )
))
(declare-datatypes ((List!6886 0))(
  ( (Nil!6883) (Cons!6882 (h!7738 tuple2!6866) (t!12054 List!6886)) )
))
(declare-datatypes ((ListLongMap!5781 0))(
  ( (ListLongMap!5782 (toList!2906 List!6886)) )
))
(declare-fun lt!189998 () ListLongMap!5781)

(declare-fun minValue!515 () V!15323)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!15323)

(declare-fun lt!190002 () array!25190)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun lt!190001 () array!25188)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun +!1183 (ListLongMap!5781 tuple2!6866) ListLongMap!5781)

(declare-fun getCurrentListMapNoExtraKeys!1155 (array!25188 array!25190 (_ BitVec 32) (_ BitVec 32) V!15323 V!15323 (_ BitVec 32) Int) ListLongMap!5781)

(declare-fun get!5943 (ValueCell!4988 V!15323) V!15323)

(declare-fun dynLambda!652 (Int (_ BitVec 64)) V!15323)

(assert (=> b!414314 (= lt!189998 (+!1183 (getCurrentListMapNoExtraKeys!1155 lt!190001 lt!190002 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!6867 (select (arr!12043 lt!190001) from!863) (get!5943 (select (arr!12044 lt!190002) from!863) (dynLambda!652 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!414315 () Bool)

(declare-fun res!240917 () Bool)

(assert (=> b!414315 (=> (not res!240917) (not e!247619))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!414315 (= res!240917 (validKeyInArray!0 k0!794))))

(declare-fun b!414316 () Bool)

(declare-fun e!247622 () Bool)

(assert (=> b!414316 (= e!247619 e!247622)))

(declare-fun res!240914 () Bool)

(assert (=> b!414316 (=> (not res!240914) (not e!247622))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25188 (_ BitVec 32)) Bool)

(assert (=> b!414316 (= res!240914 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!190001 mask!1025))))

(assert (=> b!414316 (= lt!190001 (array!25189 (store (arr!12043 _keys!709) i!563 k0!794) (size!12395 _keys!709)))))

(declare-fun b!414317 () Bool)

(declare-fun e!247620 () Bool)

(assert (=> b!414317 (= e!247620 (not e!247621))))

(declare-fun res!240924 () Bool)

(assert (=> b!414317 (=> res!240924 e!247621)))

(assert (=> b!414317 (= res!240924 (validKeyInArray!0 (select (arr!12043 _keys!709) from!863)))))

(declare-fun e!247624 () Bool)

(assert (=> b!414317 e!247624))

(declare-fun c!54957 () Bool)

(assert (=> b!414317 (= c!54957 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12253 0))(
  ( (Unit!12254) )
))
(declare-fun lt!190000 () Unit!12253)

(declare-fun v!412 () V!15323)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!394 (array!25188 array!25190 (_ BitVec 32) (_ BitVec 32) V!15323 V!15323 (_ BitVec 32) (_ BitVec 64) V!15323 (_ BitVec 32) Int) Unit!12253)

(assert (=> b!414317 (= lt!190000 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!394 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!414318 () Bool)

(declare-fun res!240922 () Bool)

(assert (=> b!414318 (=> (not res!240922) (not e!247619))))

(assert (=> b!414318 (= res!240922 (and (= (size!12396 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12395 _keys!709) (size!12396 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!414319 () Bool)

(declare-fun res!240915 () Bool)

(assert (=> b!414319 (=> (not res!240915) (not e!247619))))

(declare-datatypes ((List!6887 0))(
  ( (Nil!6884) (Cons!6883 (h!7739 (_ BitVec 64)) (t!12055 List!6887)) )
))
(declare-fun arrayNoDuplicates!0 (array!25188 (_ BitVec 32) List!6887) Bool)

(assert (=> b!414319 (= res!240915 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6884))))

(declare-fun bm!28695 () Bool)

(declare-fun call!28699 () ListLongMap!5781)

(assert (=> bm!28695 (= call!28699 (getCurrentListMapNoExtraKeys!1155 (ite c!54957 lt!190001 _keys!709) (ite c!54957 lt!190002 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!414320 () Bool)

(declare-fun res!240919 () Bool)

(assert (=> b!414320 (=> (not res!240919) (not e!247619))))

(assert (=> b!414320 (= res!240919 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!414321 () Bool)

(assert (=> b!414321 (= e!247622 e!247620)))

(declare-fun res!240912 () Bool)

(assert (=> b!414321 (=> (not res!240912) (not e!247620))))

(assert (=> b!414321 (= res!240912 (= from!863 i!563))))

(assert (=> b!414321 (= lt!189998 (getCurrentListMapNoExtraKeys!1155 lt!190001 lt!190002 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!414321 (= lt!190002 (array!25191 (store (arr!12044 _values!549) i!563 (ValueCellFull!4988 v!412)) (size!12396 _values!549)))))

(declare-fun lt!189999 () ListLongMap!5781)

(assert (=> b!414321 (= lt!189999 (getCurrentListMapNoExtraKeys!1155 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!414322 () Bool)

(declare-fun call!28698 () ListLongMap!5781)

(assert (=> b!414322 (= e!247624 (= call!28699 (+!1183 call!28698 (tuple2!6867 k0!794 v!412))))))

(declare-fun b!414323 () Bool)

(declare-fun res!240920 () Bool)

(assert (=> b!414323 (=> (not res!240920) (not e!247622))))

(assert (=> b!414323 (= res!240920 (arrayNoDuplicates!0 lt!190001 #b00000000000000000000000000000000 Nil!6884))))

(declare-fun b!414324 () Bool)

(declare-fun res!240913 () Bool)

(assert (=> b!414324 (=> (not res!240913) (not e!247619))))

(declare-fun arrayContainsKey!0 (array!25188 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!414324 (= res!240913 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun bm!28696 () Bool)

(assert (=> bm!28696 (= call!28698 (getCurrentListMapNoExtraKeys!1155 (ite c!54957 _keys!709 lt!190001) (ite c!54957 _values!549 lt!190002) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!414325 () Bool)

(declare-fun e!247616 () Bool)

(declare-fun e!247617 () Bool)

(assert (=> b!414325 (= e!247616 (and e!247617 mapRes!17616))))

(declare-fun condMapEmpty!17616 () Bool)

(declare-fun mapDefault!17616 () ValueCell!4988)

(assert (=> b!414325 (= condMapEmpty!17616 (= (arr!12044 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4988)) mapDefault!17616)))))

(declare-fun b!414326 () Bool)

(declare-fun res!240916 () Bool)

(assert (=> b!414326 (=> (not res!240916) (not e!247619))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!414326 (= res!240916 (validMask!0 mask!1025))))

(declare-fun b!414327 () Bool)

(declare-fun tp_is_empty!10663 () Bool)

(assert (=> b!414327 (= e!247623 tp_is_empty!10663)))

(declare-fun b!414328 () Bool)

(declare-fun res!240911 () Bool)

(assert (=> b!414328 (=> (not res!240911) (not e!247622))))

(assert (=> b!414328 (= res!240911 (bvsle from!863 i!563))))

(declare-fun b!414329 () Bool)

(declare-fun res!240921 () Bool)

(assert (=> b!414329 (=> (not res!240921) (not e!247619))))

(assert (=> b!414329 (= res!240921 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12395 _keys!709))))))

(declare-fun res!240918 () Bool)

(assert (=> start!39230 (=> (not res!240918) (not e!247619))))

(assert (=> start!39230 (= res!240918 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12395 _keys!709))))))

(assert (=> start!39230 e!247619))

(assert (=> start!39230 tp_is_empty!10663))

(assert (=> start!39230 tp!34062))

(assert (=> start!39230 true))

(declare-fun array_inv!8866 (array!25190) Bool)

(assert (=> start!39230 (and (array_inv!8866 _values!549) e!247616)))

(declare-fun array_inv!8867 (array!25188) Bool)

(assert (=> start!39230 (array_inv!8867 _keys!709)))

(declare-fun b!414330 () Bool)

(assert (=> b!414330 (= e!247617 tp_is_empty!10663)))

(declare-fun mapIsEmpty!17616 () Bool)

(assert (=> mapIsEmpty!17616 mapRes!17616))

(declare-fun b!414331 () Bool)

(assert (=> b!414331 (= e!247624 (= call!28698 call!28699))))

(assert (= (and start!39230 res!240918) b!414326))

(assert (= (and b!414326 res!240916) b!414318))

(assert (= (and b!414318 res!240922) b!414320))

(assert (= (and b!414320 res!240919) b!414319))

(assert (= (and b!414319 res!240915) b!414329))

(assert (= (and b!414329 res!240921) b!414315))

(assert (= (and b!414315 res!240917) b!414313))

(assert (= (and b!414313 res!240923) b!414324))

(assert (= (and b!414324 res!240913) b!414316))

(assert (= (and b!414316 res!240914) b!414323))

(assert (= (and b!414323 res!240920) b!414328))

(assert (= (and b!414328 res!240911) b!414321))

(assert (= (and b!414321 res!240912) b!414317))

(assert (= (and b!414317 c!54957) b!414322))

(assert (= (and b!414317 (not c!54957)) b!414331))

(assert (= (or b!414322 b!414331) bm!28695))

(assert (= (or b!414322 b!414331) bm!28696))

(assert (= (and b!414317 (not res!240924)) b!414314))

(assert (= (and b!414325 condMapEmpty!17616) mapIsEmpty!17616))

(assert (= (and b!414325 (not condMapEmpty!17616)) mapNonEmpty!17616))

(get-info :version)

(assert (= (and mapNonEmpty!17616 ((_ is ValueCellFull!4988) mapValue!17616)) b!414327))

(assert (= (and b!414325 ((_ is ValueCellFull!4988) mapDefault!17616)) b!414330))

(assert (= start!39230 b!414325))

(declare-fun b_lambda!8837 () Bool)

(assert (=> (not b_lambda!8837) (not b!414314)))

(declare-fun t!12053 () Bool)

(declare-fun tb!3125 () Bool)

(assert (=> (and start!39230 (= defaultEntry!557 defaultEntry!557) t!12053) tb!3125))

(declare-fun result!5785 () Bool)

(assert (=> tb!3125 (= result!5785 tp_is_empty!10663)))

(assert (=> b!414314 t!12053))

(declare-fun b_and!16913 () Bool)

(assert (= b_and!16911 (and (=> t!12053 result!5785) b_and!16913)))

(declare-fun m!403821 () Bool)

(assert (=> b!414323 m!403821))

(declare-fun m!403823 () Bool)

(assert (=> b!414320 m!403823))

(declare-fun m!403825 () Bool)

(assert (=> b!414315 m!403825))

(declare-fun m!403827 () Bool)

(assert (=> mapNonEmpty!17616 m!403827))

(declare-fun m!403829 () Bool)

(assert (=> b!414322 m!403829))

(declare-fun m!403831 () Bool)

(assert (=> b!414324 m!403831))

(declare-fun m!403833 () Bool)

(assert (=> bm!28695 m!403833))

(declare-fun m!403835 () Bool)

(assert (=> b!414326 m!403835))

(declare-fun m!403837 () Bool)

(assert (=> b!414317 m!403837))

(assert (=> b!414317 m!403837))

(declare-fun m!403839 () Bool)

(assert (=> b!414317 m!403839))

(declare-fun m!403841 () Bool)

(assert (=> b!414317 m!403841))

(declare-fun m!403843 () Bool)

(assert (=> b!414319 m!403843))

(declare-fun m!403845 () Bool)

(assert (=> b!414313 m!403845))

(declare-fun m!403847 () Bool)

(assert (=> bm!28696 m!403847))

(declare-fun m!403849 () Bool)

(assert (=> start!39230 m!403849))

(declare-fun m!403851 () Bool)

(assert (=> start!39230 m!403851))

(declare-fun m!403853 () Bool)

(assert (=> b!414316 m!403853))

(declare-fun m!403855 () Bool)

(assert (=> b!414316 m!403855))

(declare-fun m!403857 () Bool)

(assert (=> b!414321 m!403857))

(declare-fun m!403859 () Bool)

(assert (=> b!414321 m!403859))

(declare-fun m!403861 () Bool)

(assert (=> b!414321 m!403861))

(declare-fun m!403863 () Bool)

(assert (=> b!414314 m!403863))

(declare-fun m!403865 () Bool)

(assert (=> b!414314 m!403865))

(declare-fun m!403867 () Bool)

(assert (=> b!414314 m!403867))

(declare-fun m!403869 () Bool)

(assert (=> b!414314 m!403869))

(declare-fun m!403871 () Bool)

(assert (=> b!414314 m!403871))

(assert (=> b!414314 m!403871))

(assert (=> b!414314 m!403867))

(declare-fun m!403873 () Bool)

(assert (=> b!414314 m!403873))

(assert (=> b!414314 m!403863))

(check-sat (not b!414321) b_and!16913 (not b!414324) (not bm!28695) (not b!414323) (not b!414319) (not bm!28696) (not b!414315) (not b!414316) (not mapNonEmpty!17616) tp_is_empty!10663 (not b!414317) (not b!414322) (not b_next!9511) (not b!414314) (not b!414320) (not b!414326) (not b_lambda!8837) (not start!39230))
(check-sat b_and!16913 (not b_next!9511))

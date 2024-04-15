; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41002 () Bool)

(assert start!41002)

(declare-fun b_free!10951 () Bool)

(declare-fun b_next!10951 () Bool)

(assert (=> start!41002 (= b_free!10951 (not b_next!10951))))

(declare-fun tp!38680 () Bool)

(declare-fun b_and!19067 () Bool)

(assert (=> start!41002 (= tp!38680 b_and!19067)))

(declare-fun b!456827 () Bool)

(declare-fun res!272788 () Bool)

(declare-fun e!266820 () Bool)

(assert (=> b!456827 (=> (not res!272788) (not e!266820))))

(declare-datatypes ((array!28369 0))(
  ( (array!28370 (arr!13628 (Array (_ BitVec 32) (_ BitVec 64))) (size!13981 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28369)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!456827 (= res!272788 (or (= (select (arr!13628 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13628 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!20074 () Bool)

(declare-fun mapRes!20074 () Bool)

(assert (=> mapIsEmpty!20074 mapRes!20074))

(declare-fun b!456828 () Bool)

(declare-fun e!266815 () Bool)

(declare-fun tp_is_empty!12289 () Bool)

(assert (=> b!456828 (= e!266815 tp_is_empty!12289)))

(declare-fun b!456829 () Bool)

(declare-fun res!272789 () Bool)

(assert (=> b!456829 (=> (not res!272789) (not e!266820))))

(declare-datatypes ((List!8238 0))(
  ( (Nil!8235) (Cons!8234 (h!9090 (_ BitVec 64)) (t!14059 List!8238)) )
))
(declare-fun arrayNoDuplicates!0 (array!28369 (_ BitVec 32) List!8238) Bool)

(assert (=> b!456829 (= res!272789 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8235))))

(declare-fun b!456830 () Bool)

(declare-fun res!272790 () Bool)

(declare-fun e!266816 () Bool)

(assert (=> b!456830 (=> (not res!272790) (not e!266816))))

(declare-fun lt!206522 () array!28369)

(assert (=> b!456830 (= res!272790 (arrayNoDuplicates!0 lt!206522 #b00000000000000000000000000000000 Nil!8235))))

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((V!17491 0))(
  ( (V!17492 (val!6189 Int)) )
))
(declare-datatypes ((tuple2!8174 0))(
  ( (tuple2!8175 (_1!4098 (_ BitVec 64)) (_2!4098 V!17491)) )
))
(declare-datatypes ((List!8239 0))(
  ( (Nil!8236) (Cons!8235 (h!9091 tuple2!8174) (t!14060 List!8239)) )
))
(declare-datatypes ((ListLongMap!7077 0))(
  ( (ListLongMap!7078 (toList!3554 List!8239)) )
))
(declare-fun lt!206521 () ListLongMap!7077)

(declare-fun lt!206519 () ListLongMap!7077)

(declare-fun e!266819 () Bool)

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5801 0))(
  ( (ValueCellFull!5801 (v!8449 V!17491)) (EmptyCell!5801) )
))
(declare-datatypes ((array!28371 0))(
  ( (array!28372 (arr!13629 (Array (_ BitVec 32) ValueCell!5801)) (size!13982 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28371)

(declare-fun b!456831 () Bool)

(declare-fun +!1608 (ListLongMap!7077 tuple2!8174) ListLongMap!7077)

(declare-fun get!6706 (ValueCell!5801 V!17491) V!17491)

(declare-fun dynLambda!871 (Int (_ BitVec 64)) V!17491)

(assert (=> b!456831 (= e!266819 (= lt!206521 (+!1608 lt!206519 (tuple2!8175 (select (arr!13628 _keys!709) from!863) (get!6706 (select (arr!13629 _values!549) from!863) (dynLambda!871 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!456832 () Bool)

(declare-fun res!272781 () Bool)

(assert (=> b!456832 (=> (not res!272781) (not e!266816))))

(assert (=> b!456832 (= res!272781 (bvsle from!863 i!563))))

(declare-fun b!456833 () Bool)

(declare-fun res!272786 () Bool)

(assert (=> b!456833 (=> (not res!272786) (not e!266820))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28369 (_ BitVec 32)) Bool)

(assert (=> b!456833 (= res!272786 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!456834 () Bool)

(declare-fun res!272783 () Bool)

(assert (=> b!456834 (=> (not res!272783) (not e!266820))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!456834 (= res!272783 (and (= (size!13982 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13981 _keys!709) (size!13982 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!456835 () Bool)

(declare-fun e!266821 () Bool)

(assert (=> b!456835 (= e!266821 (not e!266819))))

(declare-fun res!272792 () Bool)

(assert (=> b!456835 (=> res!272792 e!266819)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!456835 (= res!272792 (not (validKeyInArray!0 (select (arr!13628 _keys!709) from!863))))))

(declare-fun lt!206523 () ListLongMap!7077)

(assert (=> b!456835 (= lt!206523 lt!206519)))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun lt!206518 () ListLongMap!7077)

(declare-fun v!412 () V!17491)

(assert (=> b!456835 (= lt!206519 (+!1608 lt!206518 (tuple2!8175 k0!794 v!412)))))

(declare-fun minValue!515 () V!17491)

(declare-fun zeroValue!515 () V!17491)

(declare-fun lt!206524 () array!28371)

(declare-fun getCurrentListMapNoExtraKeys!1749 (array!28369 array!28371 (_ BitVec 32) (_ BitVec 32) V!17491 V!17491 (_ BitVec 32) Int) ListLongMap!7077)

(assert (=> b!456835 (= lt!206523 (getCurrentListMapNoExtraKeys!1749 lt!206522 lt!206524 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!456835 (= lt!206518 (getCurrentListMapNoExtraKeys!1749 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-datatypes ((Unit!13265 0))(
  ( (Unit!13266) )
))
(declare-fun lt!206525 () Unit!13265)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!745 (array!28369 array!28371 (_ BitVec 32) (_ BitVec 32) V!17491 V!17491 (_ BitVec 32) (_ BitVec 64) V!17491 (_ BitVec 32) Int) Unit!13265)

(assert (=> b!456835 (= lt!206525 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!745 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!456836 () Bool)

(declare-fun e!266818 () Bool)

(declare-fun e!266817 () Bool)

(assert (=> b!456836 (= e!266818 (and e!266817 mapRes!20074))))

(declare-fun condMapEmpty!20074 () Bool)

(declare-fun mapDefault!20074 () ValueCell!5801)

(assert (=> b!456836 (= condMapEmpty!20074 (= (arr!13629 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5801)) mapDefault!20074)))))

(declare-fun b!456837 () Bool)

(declare-fun res!272791 () Bool)

(assert (=> b!456837 (=> (not res!272791) (not e!266820))))

(declare-fun arrayContainsKey!0 (array!28369 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!456837 (= res!272791 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!456838 () Bool)

(declare-fun res!272779 () Bool)

(assert (=> b!456838 (=> (not res!272779) (not e!266820))))

(assert (=> b!456838 (= res!272779 (validKeyInArray!0 k0!794))))

(declare-fun b!456839 () Bool)

(assert (=> b!456839 (= e!266820 e!266816)))

(declare-fun res!272784 () Bool)

(assert (=> b!456839 (=> (not res!272784) (not e!266816))))

(assert (=> b!456839 (= res!272784 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!206522 mask!1025))))

(assert (=> b!456839 (= lt!206522 (array!28370 (store (arr!13628 _keys!709) i!563 k0!794) (size!13981 _keys!709)))))

(declare-fun b!456840 () Bool)

(declare-fun res!272780 () Bool)

(assert (=> b!456840 (=> (not res!272780) (not e!266820))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!456840 (= res!272780 (validMask!0 mask!1025))))

(declare-fun b!456841 () Bool)

(declare-fun res!272782 () Bool)

(assert (=> b!456841 (=> (not res!272782) (not e!266820))))

(assert (=> b!456841 (= res!272782 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13981 _keys!709))))))

(declare-fun mapNonEmpty!20074 () Bool)

(declare-fun tp!38679 () Bool)

(assert (=> mapNonEmpty!20074 (= mapRes!20074 (and tp!38679 e!266815))))

(declare-fun mapKey!20074 () (_ BitVec 32))

(declare-fun mapRest!20074 () (Array (_ BitVec 32) ValueCell!5801))

(declare-fun mapValue!20074 () ValueCell!5801)

(assert (=> mapNonEmpty!20074 (= (arr!13629 _values!549) (store mapRest!20074 mapKey!20074 mapValue!20074))))

(declare-fun res!272787 () Bool)

(assert (=> start!41002 (=> (not res!272787) (not e!266820))))

(assert (=> start!41002 (= res!272787 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13981 _keys!709))))))

(assert (=> start!41002 e!266820))

(assert (=> start!41002 tp_is_empty!12289))

(assert (=> start!41002 tp!38680))

(assert (=> start!41002 true))

(declare-fun array_inv!9930 (array!28371) Bool)

(assert (=> start!41002 (and (array_inv!9930 _values!549) e!266818)))

(declare-fun array_inv!9931 (array!28369) Bool)

(assert (=> start!41002 (array_inv!9931 _keys!709)))

(declare-fun b!456842 () Bool)

(assert (=> b!456842 (= e!266817 tp_is_empty!12289)))

(declare-fun b!456843 () Bool)

(assert (=> b!456843 (= e!266816 e!266821)))

(declare-fun res!272785 () Bool)

(assert (=> b!456843 (=> (not res!272785) (not e!266821))))

(assert (=> b!456843 (= res!272785 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(assert (=> b!456843 (= lt!206521 (getCurrentListMapNoExtraKeys!1749 lt!206522 lt!206524 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!456843 (= lt!206524 (array!28372 (store (arr!13629 _values!549) i!563 (ValueCellFull!5801 v!412)) (size!13982 _values!549)))))

(declare-fun lt!206520 () ListLongMap!7077)

(assert (=> b!456843 (= lt!206520 (getCurrentListMapNoExtraKeys!1749 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (= (and start!41002 res!272787) b!456840))

(assert (= (and b!456840 res!272780) b!456834))

(assert (= (and b!456834 res!272783) b!456833))

(assert (= (and b!456833 res!272786) b!456829))

(assert (= (and b!456829 res!272789) b!456841))

(assert (= (and b!456841 res!272782) b!456838))

(assert (= (and b!456838 res!272779) b!456827))

(assert (= (and b!456827 res!272788) b!456837))

(assert (= (and b!456837 res!272791) b!456839))

(assert (= (and b!456839 res!272784) b!456830))

(assert (= (and b!456830 res!272790) b!456832))

(assert (= (and b!456832 res!272781) b!456843))

(assert (= (and b!456843 res!272785) b!456835))

(assert (= (and b!456835 (not res!272792)) b!456831))

(assert (= (and b!456836 condMapEmpty!20074) mapIsEmpty!20074))

(assert (= (and b!456836 (not condMapEmpty!20074)) mapNonEmpty!20074))

(get-info :version)

(assert (= (and mapNonEmpty!20074 ((_ is ValueCellFull!5801) mapValue!20074)) b!456828))

(assert (= (and b!456836 ((_ is ValueCellFull!5801) mapDefault!20074)) b!456842))

(assert (= start!41002 b!456836))

(declare-fun b_lambda!9665 () Bool)

(assert (=> (not b_lambda!9665) (not b!456831)))

(declare-fun t!14058 () Bool)

(declare-fun tb!3779 () Bool)

(assert (=> (and start!41002 (= defaultEntry!557 defaultEntry!557) t!14058) tb!3779))

(declare-fun result!7105 () Bool)

(assert (=> tb!3779 (= result!7105 tp_is_empty!12289)))

(assert (=> b!456831 t!14058))

(declare-fun b_and!19069 () Bool)

(assert (= b_and!19067 (and (=> t!14058 result!7105) b_and!19069)))

(declare-fun m!439703 () Bool)

(assert (=> start!41002 m!439703))

(declare-fun m!439705 () Bool)

(assert (=> start!41002 m!439705))

(declare-fun m!439707 () Bool)

(assert (=> b!456835 m!439707))

(declare-fun m!439709 () Bool)

(assert (=> b!456835 m!439709))

(declare-fun m!439711 () Bool)

(assert (=> b!456835 m!439711))

(declare-fun m!439713 () Bool)

(assert (=> b!456835 m!439713))

(assert (=> b!456835 m!439707))

(declare-fun m!439715 () Bool)

(assert (=> b!456835 m!439715))

(declare-fun m!439717 () Bool)

(assert (=> b!456835 m!439717))

(assert (=> b!456831 m!439707))

(declare-fun m!439719 () Bool)

(assert (=> b!456831 m!439719))

(assert (=> b!456831 m!439719))

(declare-fun m!439721 () Bool)

(assert (=> b!456831 m!439721))

(declare-fun m!439723 () Bool)

(assert (=> b!456831 m!439723))

(declare-fun m!439725 () Bool)

(assert (=> b!456831 m!439725))

(assert (=> b!456831 m!439721))

(declare-fun m!439727 () Bool)

(assert (=> b!456843 m!439727))

(declare-fun m!439729 () Bool)

(assert (=> b!456843 m!439729))

(declare-fun m!439731 () Bool)

(assert (=> b!456843 m!439731))

(declare-fun m!439733 () Bool)

(assert (=> b!456837 m!439733))

(declare-fun m!439735 () Bool)

(assert (=> b!456839 m!439735))

(declare-fun m!439737 () Bool)

(assert (=> b!456839 m!439737))

(declare-fun m!439739 () Bool)

(assert (=> b!456830 m!439739))

(declare-fun m!439741 () Bool)

(assert (=> b!456829 m!439741))

(declare-fun m!439743 () Bool)

(assert (=> b!456838 m!439743))

(declare-fun m!439745 () Bool)

(assert (=> b!456840 m!439745))

(declare-fun m!439747 () Bool)

(assert (=> b!456827 m!439747))

(declare-fun m!439749 () Bool)

(assert (=> mapNonEmpty!20074 m!439749))

(declare-fun m!439751 () Bool)

(assert (=> b!456833 m!439751))

(check-sat (not b_next!10951) (not b!456843) b_and!19069 (not b!456837) (not start!41002) (not b!456839) (not b!456833) (not b_lambda!9665) tp_is_empty!12289 (not b!456835) (not b!456840) (not b!456829) (not b!456830) (not b!456831) (not mapNonEmpty!20074) (not b!456838))
(check-sat b_and!19069 (not b_next!10951))
(get-model)

(declare-fun b_lambda!9671 () Bool)

(assert (= b_lambda!9665 (or (and start!41002 b_free!10951) b_lambda!9671)))

(check-sat (not b_next!10951) (not b!456843) b_and!19069 (not b!456837) (not start!41002) (not b!456839) (not b!456833) tp_is_empty!12289 (not b!456835) (not b!456829) (not b!456830) (not b!456831) (not mapNonEmpty!20074) (not b!456838) (not b_lambda!9671) (not b!456840))
(check-sat b_and!19069 (not b_next!10951))
(get-model)

(declare-fun b!456976 () Bool)

(declare-fun e!266885 () ListLongMap!7077)

(declare-fun call!30069 () ListLongMap!7077)

(assert (=> b!456976 (= e!266885 call!30069)))

(declare-fun b!456977 () Bool)

(declare-fun e!266886 () Bool)

(declare-fun e!266890 () Bool)

(assert (=> b!456977 (= e!266886 e!266890)))

(assert (=> b!456977 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!13981 lt!206522)))))

(declare-fun lt!206590 () ListLongMap!7077)

(declare-fun res!272886 () Bool)

(declare-fun contains!2489 (ListLongMap!7077 (_ BitVec 64)) Bool)

(assert (=> b!456977 (= res!272886 (contains!2489 lt!206590 (select (arr!13628 lt!206522) from!863)))))

(assert (=> b!456977 (=> (not res!272886) (not e!266890))))

(declare-fun b!456978 () Bool)

(declare-fun e!266884 () Bool)

(assert (=> b!456978 (= e!266886 e!266884)))

(declare-fun c!56280 () Bool)

(assert (=> b!456978 (= c!56280 (bvslt from!863 (size!13981 lt!206522)))))

(declare-fun b!456979 () Bool)

(declare-fun res!272888 () Bool)

(declare-fun e!266889 () Bool)

(assert (=> b!456979 (=> (not res!272888) (not e!266889))))

(assert (=> b!456979 (= res!272888 (not (contains!2489 lt!206590 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!456980 () Bool)

(assert (=> b!456980 (= e!266889 e!266886)))

(declare-fun c!56277 () Bool)

(declare-fun e!266887 () Bool)

(assert (=> b!456980 (= c!56277 e!266887)))

(declare-fun res!272885 () Bool)

(assert (=> b!456980 (=> (not res!272885) (not e!266887))))

(assert (=> b!456980 (= res!272885 (bvslt from!863 (size!13981 lt!206522)))))

(declare-fun b!456981 () Bool)

(assert (=> b!456981 (= e!266887 (validKeyInArray!0 (select (arr!13628 lt!206522) from!863)))))

(assert (=> b!456981 (bvsge from!863 #b00000000000000000000000000000000)))

(declare-fun bm!30066 () Bool)

(assert (=> bm!30066 (= call!30069 (getCurrentListMapNoExtraKeys!1749 lt!206522 lt!206524 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd from!863 #b00000000000000000000000000000001) defaultEntry!557))))

(declare-fun b!456982 () Bool)

(declare-fun isEmpty!565 (ListLongMap!7077) Bool)

(assert (=> b!456982 (= e!266884 (isEmpty!565 lt!206590))))

(declare-fun b!456983 () Bool)

(assert (=> b!456983 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!13981 lt!206522)))))

(assert (=> b!456983 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!13982 lt!206524)))))

(declare-fun apply!314 (ListLongMap!7077 (_ BitVec 64)) V!17491)

(assert (=> b!456983 (= e!266890 (= (apply!314 lt!206590 (select (arr!13628 lt!206522) from!863)) (get!6706 (select (arr!13629 lt!206524) from!863) (dynLambda!871 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!456984 () Bool)

(declare-fun e!266888 () ListLongMap!7077)

(assert (=> b!456984 (= e!266888 (ListLongMap!7078 Nil!8236))))

(declare-fun d!74459 () Bool)

(assert (=> d!74459 e!266889))

(declare-fun res!272887 () Bool)

(assert (=> d!74459 (=> (not res!272887) (not e!266889))))

(assert (=> d!74459 (= res!272887 (not (contains!2489 lt!206590 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74459 (= lt!206590 e!266888)))

(declare-fun c!56279 () Bool)

(assert (=> d!74459 (= c!56279 (bvsge from!863 (size!13981 lt!206522)))))

(assert (=> d!74459 (validMask!0 mask!1025)))

(assert (=> d!74459 (= (getCurrentListMapNoExtraKeys!1749 lt!206522 lt!206524 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557) lt!206590)))

(declare-fun b!456985 () Bool)

(assert (=> b!456985 (= e!266888 e!266885)))

(declare-fun c!56278 () Bool)

(assert (=> b!456985 (= c!56278 (validKeyInArray!0 (select (arr!13628 lt!206522) from!863)))))

(declare-fun b!456986 () Bool)

(assert (=> b!456986 (= e!266884 (= lt!206590 (getCurrentListMapNoExtraKeys!1749 lt!206522 lt!206524 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd from!863 #b00000000000000000000000000000001) defaultEntry!557)))))

(declare-fun b!456987 () Bool)

(declare-fun lt!206594 () Unit!13265)

(declare-fun lt!206591 () Unit!13265)

(assert (=> b!456987 (= lt!206594 lt!206591)))

(declare-fun lt!206589 () ListLongMap!7077)

(declare-fun lt!206588 () V!17491)

(declare-fun lt!206593 () (_ BitVec 64))

(declare-fun lt!206592 () (_ BitVec 64))

(assert (=> b!456987 (not (contains!2489 (+!1608 lt!206589 (tuple2!8175 lt!206593 lt!206588)) lt!206592))))

(declare-fun addStillNotContains!148 (ListLongMap!7077 (_ BitVec 64) V!17491 (_ BitVec 64)) Unit!13265)

(assert (=> b!456987 (= lt!206591 (addStillNotContains!148 lt!206589 lt!206593 lt!206588 lt!206592))))

(assert (=> b!456987 (= lt!206592 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!456987 (= lt!206588 (get!6706 (select (arr!13629 lt!206524) from!863) (dynLambda!871 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!456987 (= lt!206593 (select (arr!13628 lt!206522) from!863))))

(assert (=> b!456987 (= lt!206589 call!30069)))

(assert (=> b!456987 (= e!266885 (+!1608 call!30069 (tuple2!8175 (select (arr!13628 lt!206522) from!863) (get!6706 (select (arr!13629 lt!206524) from!863) (dynLambda!871 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!74459 c!56279) b!456984))

(assert (= (and d!74459 (not c!56279)) b!456985))

(assert (= (and b!456985 c!56278) b!456987))

(assert (= (and b!456985 (not c!56278)) b!456976))

(assert (= (or b!456987 b!456976) bm!30066))

(assert (= (and d!74459 res!272887) b!456979))

(assert (= (and b!456979 res!272888) b!456980))

(assert (= (and b!456980 res!272885) b!456981))

(assert (= (and b!456980 c!56277) b!456977))

(assert (= (and b!456980 (not c!56277)) b!456978))

(assert (= (and b!456977 res!272886) b!456983))

(assert (= (and b!456978 c!56280) b!456986))

(assert (= (and b!456978 (not c!56280)) b!456982))

(declare-fun b_lambda!9673 () Bool)

(assert (=> (not b_lambda!9673) (not b!456983)))

(assert (=> b!456983 t!14058))

(declare-fun b_and!19079 () Bool)

(assert (= b_and!19069 (and (=> t!14058 result!7105) b_and!19079)))

(declare-fun b_lambda!9675 () Bool)

(assert (=> (not b_lambda!9675) (not b!456987)))

(assert (=> b!456987 t!14058))

(declare-fun b_and!19081 () Bool)

(assert (= b_and!19079 (and (=> t!14058 result!7105) b_and!19081)))

(declare-fun m!439853 () Bool)

(assert (=> b!456982 m!439853))

(declare-fun m!439855 () Bool)

(assert (=> bm!30066 m!439855))

(declare-fun m!439857 () Bool)

(assert (=> b!456981 m!439857))

(assert (=> b!456981 m!439857))

(declare-fun m!439859 () Bool)

(assert (=> b!456981 m!439859))

(declare-fun m!439861 () Bool)

(assert (=> d!74459 m!439861))

(assert (=> d!74459 m!439745))

(declare-fun m!439863 () Bool)

(assert (=> b!456979 m!439863))

(declare-fun m!439865 () Bool)

(assert (=> b!456987 m!439865))

(assert (=> b!456987 m!439857))

(declare-fun m!439867 () Bool)

(assert (=> b!456987 m!439867))

(assert (=> b!456987 m!439721))

(declare-fun m!439869 () Bool)

(assert (=> b!456987 m!439869))

(declare-fun m!439871 () Bool)

(assert (=> b!456987 m!439871))

(declare-fun m!439873 () Bool)

(assert (=> b!456987 m!439873))

(assert (=> b!456987 m!439721))

(assert (=> b!456987 m!439871))

(declare-fun m!439875 () Bool)

(assert (=> b!456987 m!439875))

(assert (=> b!456987 m!439867))

(assert (=> b!456985 m!439857))

(assert (=> b!456985 m!439857))

(assert (=> b!456985 m!439859))

(assert (=> b!456977 m!439857))

(assert (=> b!456977 m!439857))

(declare-fun m!439877 () Bool)

(assert (=> b!456977 m!439877))

(assert (=> b!456983 m!439867))

(assert (=> b!456983 m!439721))

(assert (=> b!456983 m!439869))

(assert (=> b!456983 m!439721))

(assert (=> b!456983 m!439867))

(assert (=> b!456983 m!439857))

(declare-fun m!439879 () Bool)

(assert (=> b!456983 m!439879))

(assert (=> b!456983 m!439857))

(assert (=> b!456986 m!439855))

(assert (=> b!456843 d!74459))

(declare-fun b!456988 () Bool)

(declare-fun e!266892 () ListLongMap!7077)

(declare-fun call!30070 () ListLongMap!7077)

(assert (=> b!456988 (= e!266892 call!30070)))

(declare-fun b!456989 () Bool)

(declare-fun e!266893 () Bool)

(declare-fun e!266897 () Bool)

(assert (=> b!456989 (= e!266893 e!266897)))

(assert (=> b!456989 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!13981 _keys!709)))))

(declare-fun res!272890 () Bool)

(declare-fun lt!206597 () ListLongMap!7077)

(assert (=> b!456989 (= res!272890 (contains!2489 lt!206597 (select (arr!13628 _keys!709) from!863)))))

(assert (=> b!456989 (=> (not res!272890) (not e!266897))))

(declare-fun b!456990 () Bool)

(declare-fun e!266891 () Bool)

(assert (=> b!456990 (= e!266893 e!266891)))

(declare-fun c!56284 () Bool)

(assert (=> b!456990 (= c!56284 (bvslt from!863 (size!13981 _keys!709)))))

(declare-fun b!456991 () Bool)

(declare-fun res!272892 () Bool)

(declare-fun e!266896 () Bool)

(assert (=> b!456991 (=> (not res!272892) (not e!266896))))

(assert (=> b!456991 (= res!272892 (not (contains!2489 lt!206597 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!456992 () Bool)

(assert (=> b!456992 (= e!266896 e!266893)))

(declare-fun c!56281 () Bool)

(declare-fun e!266894 () Bool)

(assert (=> b!456992 (= c!56281 e!266894)))

(declare-fun res!272889 () Bool)

(assert (=> b!456992 (=> (not res!272889) (not e!266894))))

(assert (=> b!456992 (= res!272889 (bvslt from!863 (size!13981 _keys!709)))))

(declare-fun b!456993 () Bool)

(assert (=> b!456993 (= e!266894 (validKeyInArray!0 (select (arr!13628 _keys!709) from!863)))))

(assert (=> b!456993 (bvsge from!863 #b00000000000000000000000000000000)))

(declare-fun bm!30067 () Bool)

(assert (=> bm!30067 (= call!30070 (getCurrentListMapNoExtraKeys!1749 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd from!863 #b00000000000000000000000000000001) defaultEntry!557))))

(declare-fun b!456994 () Bool)

(assert (=> b!456994 (= e!266891 (isEmpty!565 lt!206597))))

(declare-fun b!456995 () Bool)

(assert (=> b!456995 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!13981 _keys!709)))))

(assert (=> b!456995 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!13982 _values!549)))))

(assert (=> b!456995 (= e!266897 (= (apply!314 lt!206597 (select (arr!13628 _keys!709) from!863)) (get!6706 (select (arr!13629 _values!549) from!863) (dynLambda!871 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!456996 () Bool)

(declare-fun e!266895 () ListLongMap!7077)

(assert (=> b!456996 (= e!266895 (ListLongMap!7078 Nil!8236))))

(declare-fun d!74461 () Bool)

(assert (=> d!74461 e!266896))

(declare-fun res!272891 () Bool)

(assert (=> d!74461 (=> (not res!272891) (not e!266896))))

(assert (=> d!74461 (= res!272891 (not (contains!2489 lt!206597 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74461 (= lt!206597 e!266895)))

(declare-fun c!56283 () Bool)

(assert (=> d!74461 (= c!56283 (bvsge from!863 (size!13981 _keys!709)))))

(assert (=> d!74461 (validMask!0 mask!1025)))

(assert (=> d!74461 (= (getCurrentListMapNoExtraKeys!1749 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557) lt!206597)))

(declare-fun b!456997 () Bool)

(assert (=> b!456997 (= e!266895 e!266892)))

(declare-fun c!56282 () Bool)

(assert (=> b!456997 (= c!56282 (validKeyInArray!0 (select (arr!13628 _keys!709) from!863)))))

(declare-fun b!456998 () Bool)

(assert (=> b!456998 (= e!266891 (= lt!206597 (getCurrentListMapNoExtraKeys!1749 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd from!863 #b00000000000000000000000000000001) defaultEntry!557)))))

(declare-fun b!456999 () Bool)

(declare-fun lt!206601 () Unit!13265)

(declare-fun lt!206598 () Unit!13265)

(assert (=> b!456999 (= lt!206601 lt!206598)))

(declare-fun lt!206600 () (_ BitVec 64))

(declare-fun lt!206596 () ListLongMap!7077)

(declare-fun lt!206599 () (_ BitVec 64))

(declare-fun lt!206595 () V!17491)

(assert (=> b!456999 (not (contains!2489 (+!1608 lt!206596 (tuple2!8175 lt!206600 lt!206595)) lt!206599))))

(assert (=> b!456999 (= lt!206598 (addStillNotContains!148 lt!206596 lt!206600 lt!206595 lt!206599))))

(assert (=> b!456999 (= lt!206599 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!456999 (= lt!206595 (get!6706 (select (arr!13629 _values!549) from!863) (dynLambda!871 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!456999 (= lt!206600 (select (arr!13628 _keys!709) from!863))))

(assert (=> b!456999 (= lt!206596 call!30070)))

(assert (=> b!456999 (= e!266892 (+!1608 call!30070 (tuple2!8175 (select (arr!13628 _keys!709) from!863) (get!6706 (select (arr!13629 _values!549) from!863) (dynLambda!871 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!74461 c!56283) b!456996))

(assert (= (and d!74461 (not c!56283)) b!456997))

(assert (= (and b!456997 c!56282) b!456999))

(assert (= (and b!456997 (not c!56282)) b!456988))

(assert (= (or b!456999 b!456988) bm!30067))

(assert (= (and d!74461 res!272891) b!456991))

(assert (= (and b!456991 res!272892) b!456992))

(assert (= (and b!456992 res!272889) b!456993))

(assert (= (and b!456992 c!56281) b!456989))

(assert (= (and b!456992 (not c!56281)) b!456990))

(assert (= (and b!456989 res!272890) b!456995))

(assert (= (and b!456990 c!56284) b!456998))

(assert (= (and b!456990 (not c!56284)) b!456994))

(declare-fun b_lambda!9677 () Bool)

(assert (=> (not b_lambda!9677) (not b!456995)))

(assert (=> b!456995 t!14058))

(declare-fun b_and!19083 () Bool)

(assert (= b_and!19081 (and (=> t!14058 result!7105) b_and!19083)))

(declare-fun b_lambda!9679 () Bool)

(assert (=> (not b_lambda!9679) (not b!456999)))

(assert (=> b!456999 t!14058))

(declare-fun b_and!19085 () Bool)

(assert (= b_and!19083 (and (=> t!14058 result!7105) b_and!19085)))

(declare-fun m!439881 () Bool)

(assert (=> b!456994 m!439881))

(declare-fun m!439883 () Bool)

(assert (=> bm!30067 m!439883))

(assert (=> b!456993 m!439707))

(assert (=> b!456993 m!439707))

(assert (=> b!456993 m!439715))

(declare-fun m!439885 () Bool)

(assert (=> d!74461 m!439885))

(assert (=> d!74461 m!439745))

(declare-fun m!439887 () Bool)

(assert (=> b!456991 m!439887))

(declare-fun m!439889 () Bool)

(assert (=> b!456999 m!439889))

(assert (=> b!456999 m!439707))

(assert (=> b!456999 m!439719))

(assert (=> b!456999 m!439721))

(assert (=> b!456999 m!439723))

(declare-fun m!439891 () Bool)

(assert (=> b!456999 m!439891))

(declare-fun m!439893 () Bool)

(assert (=> b!456999 m!439893))

(assert (=> b!456999 m!439721))

(assert (=> b!456999 m!439891))

(declare-fun m!439895 () Bool)

(assert (=> b!456999 m!439895))

(assert (=> b!456999 m!439719))

(assert (=> b!456997 m!439707))

(assert (=> b!456997 m!439707))

(assert (=> b!456997 m!439715))

(assert (=> b!456989 m!439707))

(assert (=> b!456989 m!439707))

(declare-fun m!439897 () Bool)

(assert (=> b!456989 m!439897))

(assert (=> b!456995 m!439719))

(assert (=> b!456995 m!439721))

(assert (=> b!456995 m!439723))

(assert (=> b!456995 m!439721))

(assert (=> b!456995 m!439719))

(assert (=> b!456995 m!439707))

(declare-fun m!439899 () Bool)

(assert (=> b!456995 m!439899))

(assert (=> b!456995 m!439707))

(assert (=> b!456998 m!439883))

(assert (=> b!456843 d!74461))

(declare-fun bm!30070 () Bool)

(declare-fun call!30073 () Bool)

(assert (=> bm!30070 (= call!30073 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!709 mask!1025))))

(declare-fun b!457008 () Bool)

(declare-fun e!266906 () Bool)

(declare-fun e!266904 () Bool)

(assert (=> b!457008 (= e!266906 e!266904)))

(declare-fun lt!206610 () (_ BitVec 64))

(assert (=> b!457008 (= lt!206610 (select (arr!13628 _keys!709) #b00000000000000000000000000000000))))

(declare-fun lt!206609 () Unit!13265)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!28369 (_ BitVec 64) (_ BitVec 32)) Unit!13265)

(assert (=> b!457008 (= lt!206609 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!709 lt!206610 #b00000000000000000000000000000000))))

(assert (=> b!457008 (arrayContainsKey!0 _keys!709 lt!206610 #b00000000000000000000000000000000)))

(declare-fun lt!206608 () Unit!13265)

(assert (=> b!457008 (= lt!206608 lt!206609)))

(declare-fun res!272897 () Bool)

(declare-datatypes ((SeekEntryResult!3528 0))(
  ( (MissingZero!3528 (index!16291 (_ BitVec 32))) (Found!3528 (index!16292 (_ BitVec 32))) (Intermediate!3528 (undefined!4340 Bool) (index!16293 (_ BitVec 32)) (x!42673 (_ BitVec 32))) (Undefined!3528) (MissingVacant!3528 (index!16294 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!28369 (_ BitVec 32)) SeekEntryResult!3528)

(assert (=> b!457008 (= res!272897 (= (seekEntryOrOpen!0 (select (arr!13628 _keys!709) #b00000000000000000000000000000000) _keys!709 mask!1025) (Found!3528 #b00000000000000000000000000000000)))))

(assert (=> b!457008 (=> (not res!272897) (not e!266904))))

(declare-fun b!457009 () Bool)

(assert (=> b!457009 (= e!266904 call!30073)))

(declare-fun d!74463 () Bool)

(declare-fun res!272898 () Bool)

(declare-fun e!266905 () Bool)

(assert (=> d!74463 (=> res!272898 e!266905)))

(assert (=> d!74463 (= res!272898 (bvsge #b00000000000000000000000000000000 (size!13981 _keys!709)))))

(assert (=> d!74463 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025) e!266905)))

(declare-fun b!457010 () Bool)

(assert (=> b!457010 (= e!266906 call!30073)))

(declare-fun b!457011 () Bool)

(assert (=> b!457011 (= e!266905 e!266906)))

(declare-fun c!56287 () Bool)

(assert (=> b!457011 (= c!56287 (validKeyInArray!0 (select (arr!13628 _keys!709) #b00000000000000000000000000000000)))))

(assert (= (and d!74463 (not res!272898)) b!457011))

(assert (= (and b!457011 c!56287) b!457008))

(assert (= (and b!457011 (not c!56287)) b!457010))

(assert (= (and b!457008 res!272897) b!457009))

(assert (= (or b!457009 b!457010) bm!30070))

(declare-fun m!439901 () Bool)

(assert (=> bm!30070 m!439901))

(declare-fun m!439903 () Bool)

(assert (=> b!457008 m!439903))

(declare-fun m!439905 () Bool)

(assert (=> b!457008 m!439905))

(declare-fun m!439907 () Bool)

(assert (=> b!457008 m!439907))

(assert (=> b!457008 m!439903))

(declare-fun m!439909 () Bool)

(assert (=> b!457008 m!439909))

(assert (=> b!457011 m!439903))

(assert (=> b!457011 m!439903))

(declare-fun m!439911 () Bool)

(assert (=> b!457011 m!439911))

(assert (=> b!456833 d!74463))

(declare-fun d!74465 () Bool)

(declare-fun res!272903 () Bool)

(declare-fun e!266911 () Bool)

(assert (=> d!74465 (=> res!272903 e!266911)))

(assert (=> d!74465 (= res!272903 (= (select (arr!13628 _keys!709) #b00000000000000000000000000000000) k0!794))))

(assert (=> d!74465 (= (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000) e!266911)))

(declare-fun b!457016 () Bool)

(declare-fun e!266912 () Bool)

(assert (=> b!457016 (= e!266911 e!266912)))

(declare-fun res!272904 () Bool)

(assert (=> b!457016 (=> (not res!272904) (not e!266912))))

(assert (=> b!457016 (= res!272904 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!13981 _keys!709)))))

(declare-fun b!457017 () Bool)

(assert (=> b!457017 (= e!266912 (arrayContainsKey!0 _keys!709 k0!794 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!74465 (not res!272903)) b!457016))

(assert (= (and b!457016 res!272904) b!457017))

(assert (=> d!74465 m!439903))

(declare-fun m!439913 () Bool)

(assert (=> b!457017 m!439913))

(assert (=> b!456837 d!74465))

(declare-fun b!457018 () Bool)

(declare-fun e!266914 () ListLongMap!7077)

(declare-fun call!30074 () ListLongMap!7077)

(assert (=> b!457018 (= e!266914 call!30074)))

(declare-fun b!457019 () Bool)

(declare-fun e!266915 () Bool)

(declare-fun e!266919 () Bool)

(assert (=> b!457019 (= e!266915 e!266919)))

(assert (=> b!457019 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13981 _keys!709)))))

(declare-fun res!272906 () Bool)

(declare-fun lt!206613 () ListLongMap!7077)

(assert (=> b!457019 (= res!272906 (contains!2489 lt!206613 (select (arr!13628 _keys!709) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> b!457019 (=> (not res!272906) (not e!266919))))

(declare-fun b!457020 () Bool)

(declare-fun e!266913 () Bool)

(assert (=> b!457020 (= e!266915 e!266913)))

(declare-fun c!56291 () Bool)

(assert (=> b!457020 (= c!56291 (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13981 _keys!709)))))

(declare-fun b!457021 () Bool)

(declare-fun res!272908 () Bool)

(declare-fun e!266918 () Bool)

(assert (=> b!457021 (=> (not res!272908) (not e!266918))))

(assert (=> b!457021 (= res!272908 (not (contains!2489 lt!206613 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!457022 () Bool)

(assert (=> b!457022 (= e!266918 e!266915)))

(declare-fun c!56288 () Bool)

(declare-fun e!266916 () Bool)

(assert (=> b!457022 (= c!56288 e!266916)))

(declare-fun res!272905 () Bool)

(assert (=> b!457022 (=> (not res!272905) (not e!266916))))

(assert (=> b!457022 (= res!272905 (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13981 _keys!709)))))

(declare-fun b!457023 () Bool)

(assert (=> b!457023 (= e!266916 (validKeyInArray!0 (select (arr!13628 _keys!709) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> b!457023 (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))

(declare-fun bm!30071 () Bool)

(assert (=> bm!30071 (= call!30074 (getCurrentListMapNoExtraKeys!1749 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) defaultEntry!557))))

(declare-fun b!457024 () Bool)

(assert (=> b!457024 (= e!266913 (isEmpty!565 lt!206613))))

(declare-fun b!457025 () Bool)

(assert (=> b!457025 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13981 _keys!709)))))

(assert (=> b!457025 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13982 _values!549)))))

(assert (=> b!457025 (= e!266919 (= (apply!314 lt!206613 (select (arr!13628 _keys!709) (bvadd #b00000000000000000000000000000001 from!863))) (get!6706 (select (arr!13629 _values!549) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!871 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!457026 () Bool)

(declare-fun e!266917 () ListLongMap!7077)

(assert (=> b!457026 (= e!266917 (ListLongMap!7078 Nil!8236))))

(declare-fun d!74467 () Bool)

(assert (=> d!74467 e!266918))

(declare-fun res!272907 () Bool)

(assert (=> d!74467 (=> (not res!272907) (not e!266918))))

(assert (=> d!74467 (= res!272907 (not (contains!2489 lt!206613 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74467 (= lt!206613 e!266917)))

(declare-fun c!56290 () Bool)

(assert (=> d!74467 (= c!56290 (bvsge (bvadd #b00000000000000000000000000000001 from!863) (size!13981 _keys!709)))))

(assert (=> d!74467 (validMask!0 mask!1025)))

(assert (=> d!74467 (= (getCurrentListMapNoExtraKeys!1749 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) lt!206613)))

(declare-fun b!457027 () Bool)

(assert (=> b!457027 (= e!266917 e!266914)))

(declare-fun c!56289 () Bool)

(assert (=> b!457027 (= c!56289 (validKeyInArray!0 (select (arr!13628 _keys!709) (bvadd #b00000000000000000000000000000001 from!863))))))

(declare-fun b!457028 () Bool)

(assert (=> b!457028 (= e!266913 (= lt!206613 (getCurrentListMapNoExtraKeys!1749 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) defaultEntry!557)))))

(declare-fun b!457029 () Bool)

(declare-fun lt!206617 () Unit!13265)

(declare-fun lt!206614 () Unit!13265)

(assert (=> b!457029 (= lt!206617 lt!206614)))

(declare-fun lt!206616 () (_ BitVec 64))

(declare-fun lt!206615 () (_ BitVec 64))

(declare-fun lt!206611 () V!17491)

(declare-fun lt!206612 () ListLongMap!7077)

(assert (=> b!457029 (not (contains!2489 (+!1608 lt!206612 (tuple2!8175 lt!206616 lt!206611)) lt!206615))))

(assert (=> b!457029 (= lt!206614 (addStillNotContains!148 lt!206612 lt!206616 lt!206611 lt!206615))))

(assert (=> b!457029 (= lt!206615 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!457029 (= lt!206611 (get!6706 (select (arr!13629 _values!549) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!871 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!457029 (= lt!206616 (select (arr!13628 _keys!709) (bvadd #b00000000000000000000000000000001 from!863)))))

(assert (=> b!457029 (= lt!206612 call!30074)))

(assert (=> b!457029 (= e!266914 (+!1608 call!30074 (tuple2!8175 (select (arr!13628 _keys!709) (bvadd #b00000000000000000000000000000001 from!863)) (get!6706 (select (arr!13629 _values!549) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!871 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!74467 c!56290) b!457026))

(assert (= (and d!74467 (not c!56290)) b!457027))

(assert (= (and b!457027 c!56289) b!457029))

(assert (= (and b!457027 (not c!56289)) b!457018))

(assert (= (or b!457029 b!457018) bm!30071))

(assert (= (and d!74467 res!272907) b!457021))

(assert (= (and b!457021 res!272908) b!457022))

(assert (= (and b!457022 res!272905) b!457023))

(assert (= (and b!457022 c!56288) b!457019))

(assert (= (and b!457022 (not c!56288)) b!457020))

(assert (= (and b!457019 res!272906) b!457025))

(assert (= (and b!457020 c!56291) b!457028))

(assert (= (and b!457020 (not c!56291)) b!457024))

(declare-fun b_lambda!9681 () Bool)

(assert (=> (not b_lambda!9681) (not b!457025)))

(assert (=> b!457025 t!14058))

(declare-fun b_and!19087 () Bool)

(assert (= b_and!19085 (and (=> t!14058 result!7105) b_and!19087)))

(declare-fun b_lambda!9683 () Bool)

(assert (=> (not b_lambda!9683) (not b!457029)))

(assert (=> b!457029 t!14058))

(declare-fun b_and!19089 () Bool)

(assert (= b_and!19087 (and (=> t!14058 result!7105) b_and!19089)))

(declare-fun m!439915 () Bool)

(assert (=> b!457024 m!439915))

(declare-fun m!439917 () Bool)

(assert (=> bm!30071 m!439917))

(declare-fun m!439919 () Bool)

(assert (=> b!457023 m!439919))

(assert (=> b!457023 m!439919))

(declare-fun m!439921 () Bool)

(assert (=> b!457023 m!439921))

(declare-fun m!439923 () Bool)

(assert (=> d!74467 m!439923))

(assert (=> d!74467 m!439745))

(declare-fun m!439925 () Bool)

(assert (=> b!457021 m!439925))

(declare-fun m!439927 () Bool)

(assert (=> b!457029 m!439927))

(assert (=> b!457029 m!439919))

(declare-fun m!439929 () Bool)

(assert (=> b!457029 m!439929))

(assert (=> b!457029 m!439721))

(declare-fun m!439931 () Bool)

(assert (=> b!457029 m!439931))

(declare-fun m!439933 () Bool)

(assert (=> b!457029 m!439933))

(declare-fun m!439935 () Bool)

(assert (=> b!457029 m!439935))

(assert (=> b!457029 m!439721))

(assert (=> b!457029 m!439933))

(declare-fun m!439937 () Bool)

(assert (=> b!457029 m!439937))

(assert (=> b!457029 m!439929))

(assert (=> b!457027 m!439919))

(assert (=> b!457027 m!439919))

(assert (=> b!457027 m!439921))

(assert (=> b!457019 m!439919))

(assert (=> b!457019 m!439919))

(declare-fun m!439939 () Bool)

(assert (=> b!457019 m!439939))

(assert (=> b!457025 m!439929))

(assert (=> b!457025 m!439721))

(assert (=> b!457025 m!439931))

(assert (=> b!457025 m!439721))

(assert (=> b!457025 m!439929))

(assert (=> b!457025 m!439919))

(declare-fun m!439941 () Bool)

(assert (=> b!457025 m!439941))

(assert (=> b!457025 m!439919))

(assert (=> b!457028 m!439917))

(assert (=> b!456835 d!74467))

(declare-fun b!457030 () Bool)

(declare-fun e!266921 () ListLongMap!7077)

(declare-fun call!30075 () ListLongMap!7077)

(assert (=> b!457030 (= e!266921 call!30075)))

(declare-fun b!457031 () Bool)

(declare-fun e!266922 () Bool)

(declare-fun e!266926 () Bool)

(assert (=> b!457031 (= e!266922 e!266926)))

(assert (=> b!457031 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13981 lt!206522)))))

(declare-fun lt!206620 () ListLongMap!7077)

(declare-fun res!272910 () Bool)

(assert (=> b!457031 (= res!272910 (contains!2489 lt!206620 (select (arr!13628 lt!206522) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> b!457031 (=> (not res!272910) (not e!266926))))

(declare-fun b!457032 () Bool)

(declare-fun e!266920 () Bool)

(assert (=> b!457032 (= e!266922 e!266920)))

(declare-fun c!56295 () Bool)

(assert (=> b!457032 (= c!56295 (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13981 lt!206522)))))

(declare-fun b!457033 () Bool)

(declare-fun res!272912 () Bool)

(declare-fun e!266925 () Bool)

(assert (=> b!457033 (=> (not res!272912) (not e!266925))))

(assert (=> b!457033 (= res!272912 (not (contains!2489 lt!206620 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!457034 () Bool)

(assert (=> b!457034 (= e!266925 e!266922)))

(declare-fun c!56292 () Bool)

(declare-fun e!266923 () Bool)

(assert (=> b!457034 (= c!56292 e!266923)))

(declare-fun res!272909 () Bool)

(assert (=> b!457034 (=> (not res!272909) (not e!266923))))

(assert (=> b!457034 (= res!272909 (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13981 lt!206522)))))

(declare-fun b!457035 () Bool)

(assert (=> b!457035 (= e!266923 (validKeyInArray!0 (select (arr!13628 lt!206522) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> b!457035 (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))

(declare-fun bm!30072 () Bool)

(assert (=> bm!30072 (= call!30075 (getCurrentListMapNoExtraKeys!1749 lt!206522 lt!206524 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) defaultEntry!557))))

(declare-fun b!457036 () Bool)

(assert (=> b!457036 (= e!266920 (isEmpty!565 lt!206620))))

(declare-fun b!457037 () Bool)

(assert (=> b!457037 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13981 lt!206522)))))

(assert (=> b!457037 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13982 lt!206524)))))

(assert (=> b!457037 (= e!266926 (= (apply!314 lt!206620 (select (arr!13628 lt!206522) (bvadd #b00000000000000000000000000000001 from!863))) (get!6706 (select (arr!13629 lt!206524) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!871 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!457038 () Bool)

(declare-fun e!266924 () ListLongMap!7077)

(assert (=> b!457038 (= e!266924 (ListLongMap!7078 Nil!8236))))

(declare-fun d!74469 () Bool)

(assert (=> d!74469 e!266925))

(declare-fun res!272911 () Bool)

(assert (=> d!74469 (=> (not res!272911) (not e!266925))))

(assert (=> d!74469 (= res!272911 (not (contains!2489 lt!206620 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74469 (= lt!206620 e!266924)))

(declare-fun c!56294 () Bool)

(assert (=> d!74469 (= c!56294 (bvsge (bvadd #b00000000000000000000000000000001 from!863) (size!13981 lt!206522)))))

(assert (=> d!74469 (validMask!0 mask!1025)))

(assert (=> d!74469 (= (getCurrentListMapNoExtraKeys!1749 lt!206522 lt!206524 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) lt!206620)))

(declare-fun b!457039 () Bool)

(assert (=> b!457039 (= e!266924 e!266921)))

(declare-fun c!56293 () Bool)

(assert (=> b!457039 (= c!56293 (validKeyInArray!0 (select (arr!13628 lt!206522) (bvadd #b00000000000000000000000000000001 from!863))))))

(declare-fun b!457040 () Bool)

(assert (=> b!457040 (= e!266920 (= lt!206620 (getCurrentListMapNoExtraKeys!1749 lt!206522 lt!206524 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) defaultEntry!557)))))

(declare-fun b!457041 () Bool)

(declare-fun lt!206624 () Unit!13265)

(declare-fun lt!206621 () Unit!13265)

(assert (=> b!457041 (= lt!206624 lt!206621)))

(declare-fun lt!206622 () (_ BitVec 64))

(declare-fun lt!206619 () ListLongMap!7077)

(declare-fun lt!206618 () V!17491)

(declare-fun lt!206623 () (_ BitVec 64))

(assert (=> b!457041 (not (contains!2489 (+!1608 lt!206619 (tuple2!8175 lt!206623 lt!206618)) lt!206622))))

(assert (=> b!457041 (= lt!206621 (addStillNotContains!148 lt!206619 lt!206623 lt!206618 lt!206622))))

(assert (=> b!457041 (= lt!206622 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!457041 (= lt!206618 (get!6706 (select (arr!13629 lt!206524) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!871 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!457041 (= lt!206623 (select (arr!13628 lt!206522) (bvadd #b00000000000000000000000000000001 from!863)))))

(assert (=> b!457041 (= lt!206619 call!30075)))

(assert (=> b!457041 (= e!266921 (+!1608 call!30075 (tuple2!8175 (select (arr!13628 lt!206522) (bvadd #b00000000000000000000000000000001 from!863)) (get!6706 (select (arr!13629 lt!206524) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!871 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!74469 c!56294) b!457038))

(assert (= (and d!74469 (not c!56294)) b!457039))

(assert (= (and b!457039 c!56293) b!457041))

(assert (= (and b!457039 (not c!56293)) b!457030))

(assert (= (or b!457041 b!457030) bm!30072))

(assert (= (and d!74469 res!272911) b!457033))

(assert (= (and b!457033 res!272912) b!457034))

(assert (= (and b!457034 res!272909) b!457035))

(assert (= (and b!457034 c!56292) b!457031))

(assert (= (and b!457034 (not c!56292)) b!457032))

(assert (= (and b!457031 res!272910) b!457037))

(assert (= (and b!457032 c!56295) b!457040))

(assert (= (and b!457032 (not c!56295)) b!457036))

(declare-fun b_lambda!9685 () Bool)

(assert (=> (not b_lambda!9685) (not b!457037)))

(assert (=> b!457037 t!14058))

(declare-fun b_and!19091 () Bool)

(assert (= b_and!19089 (and (=> t!14058 result!7105) b_and!19091)))

(declare-fun b_lambda!9687 () Bool)

(assert (=> (not b_lambda!9687) (not b!457041)))

(assert (=> b!457041 t!14058))

(declare-fun b_and!19093 () Bool)

(assert (= b_and!19091 (and (=> t!14058 result!7105) b_and!19093)))

(declare-fun m!439943 () Bool)

(assert (=> b!457036 m!439943))

(declare-fun m!439945 () Bool)

(assert (=> bm!30072 m!439945))

(declare-fun m!439947 () Bool)

(assert (=> b!457035 m!439947))

(assert (=> b!457035 m!439947))

(declare-fun m!439949 () Bool)

(assert (=> b!457035 m!439949))

(declare-fun m!439951 () Bool)

(assert (=> d!74469 m!439951))

(assert (=> d!74469 m!439745))

(declare-fun m!439953 () Bool)

(assert (=> b!457033 m!439953))

(declare-fun m!439955 () Bool)

(assert (=> b!457041 m!439955))

(assert (=> b!457041 m!439947))

(declare-fun m!439957 () Bool)

(assert (=> b!457041 m!439957))

(assert (=> b!457041 m!439721))

(declare-fun m!439959 () Bool)

(assert (=> b!457041 m!439959))

(declare-fun m!439961 () Bool)

(assert (=> b!457041 m!439961))

(declare-fun m!439963 () Bool)

(assert (=> b!457041 m!439963))

(assert (=> b!457041 m!439721))

(assert (=> b!457041 m!439961))

(declare-fun m!439965 () Bool)

(assert (=> b!457041 m!439965))

(assert (=> b!457041 m!439957))

(assert (=> b!457039 m!439947))

(assert (=> b!457039 m!439947))

(assert (=> b!457039 m!439949))

(assert (=> b!457031 m!439947))

(assert (=> b!457031 m!439947))

(declare-fun m!439967 () Bool)

(assert (=> b!457031 m!439967))

(assert (=> b!457037 m!439957))

(assert (=> b!457037 m!439721))

(assert (=> b!457037 m!439959))

(assert (=> b!457037 m!439721))

(assert (=> b!457037 m!439957))

(assert (=> b!457037 m!439947))

(declare-fun m!439969 () Bool)

(assert (=> b!457037 m!439969))

(assert (=> b!457037 m!439947))

(assert (=> b!457040 m!439945))

(assert (=> b!456835 d!74469))

(declare-fun d!74471 () Bool)

(declare-fun e!266929 () Bool)

(assert (=> d!74471 e!266929))

(declare-fun res!272918 () Bool)

(assert (=> d!74471 (=> (not res!272918) (not e!266929))))

(declare-fun lt!206634 () ListLongMap!7077)

(assert (=> d!74471 (= res!272918 (contains!2489 lt!206634 (_1!4098 (tuple2!8175 k0!794 v!412))))))

(declare-fun lt!206635 () List!8239)

(assert (=> d!74471 (= lt!206634 (ListLongMap!7078 lt!206635))))

(declare-fun lt!206633 () Unit!13265)

(declare-fun lt!206636 () Unit!13265)

(assert (=> d!74471 (= lt!206633 lt!206636)))

(declare-datatypes ((Option!375 0))(
  ( (Some!374 (v!8455 V!17491)) (None!373) )
))
(declare-fun getValueByKey!369 (List!8239 (_ BitVec 64)) Option!375)

(assert (=> d!74471 (= (getValueByKey!369 lt!206635 (_1!4098 (tuple2!8175 k0!794 v!412))) (Some!374 (_2!4098 (tuple2!8175 k0!794 v!412))))))

(declare-fun lemmaContainsTupThenGetReturnValue!194 (List!8239 (_ BitVec 64) V!17491) Unit!13265)

(assert (=> d!74471 (= lt!206636 (lemmaContainsTupThenGetReturnValue!194 lt!206635 (_1!4098 (tuple2!8175 k0!794 v!412)) (_2!4098 (tuple2!8175 k0!794 v!412))))))

(declare-fun insertStrictlySorted!197 (List!8239 (_ BitVec 64) V!17491) List!8239)

(assert (=> d!74471 (= lt!206635 (insertStrictlySorted!197 (toList!3554 lt!206518) (_1!4098 (tuple2!8175 k0!794 v!412)) (_2!4098 (tuple2!8175 k0!794 v!412))))))

(assert (=> d!74471 (= (+!1608 lt!206518 (tuple2!8175 k0!794 v!412)) lt!206634)))

(declare-fun b!457046 () Bool)

(declare-fun res!272917 () Bool)

(assert (=> b!457046 (=> (not res!272917) (not e!266929))))

(assert (=> b!457046 (= res!272917 (= (getValueByKey!369 (toList!3554 lt!206634) (_1!4098 (tuple2!8175 k0!794 v!412))) (Some!374 (_2!4098 (tuple2!8175 k0!794 v!412)))))))

(declare-fun b!457047 () Bool)

(declare-fun contains!2490 (List!8239 tuple2!8174) Bool)

(assert (=> b!457047 (= e!266929 (contains!2490 (toList!3554 lt!206634) (tuple2!8175 k0!794 v!412)))))

(assert (= (and d!74471 res!272918) b!457046))

(assert (= (and b!457046 res!272917) b!457047))

(declare-fun m!439971 () Bool)

(assert (=> d!74471 m!439971))

(declare-fun m!439973 () Bool)

(assert (=> d!74471 m!439973))

(declare-fun m!439975 () Bool)

(assert (=> d!74471 m!439975))

(declare-fun m!439977 () Bool)

(assert (=> d!74471 m!439977))

(declare-fun m!439979 () Bool)

(assert (=> b!457046 m!439979))

(declare-fun m!439981 () Bool)

(assert (=> b!457047 m!439981))

(assert (=> b!456835 d!74471))

(declare-fun d!74473 () Bool)

(assert (=> d!74473 (= (validKeyInArray!0 (select (arr!13628 _keys!709) from!863)) (and (not (= (select (arr!13628 _keys!709) from!863) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!13628 _keys!709) from!863) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!456835 d!74473))

(declare-fun d!74475 () Bool)

(declare-fun e!266935 () Bool)

(assert (=> d!74475 e!266935))

(declare-fun res!272921 () Bool)

(assert (=> d!74475 (=> (not res!272921) (not e!266935))))

(assert (=> d!74475 (= res!272921 (and (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563)) (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13981 _keys!709)))) (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563)) (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13982 _values!549)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563) (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13981 _keys!709)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563) (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13982 _values!549))))))))

(declare-fun lt!206639 () Unit!13265)

(declare-fun choose!1338 (array!28369 array!28371 (_ BitVec 32) (_ BitVec 32) V!17491 V!17491 (_ BitVec 32) (_ BitVec 64) V!17491 (_ BitVec 32) Int) Unit!13265)

(assert (=> d!74475 (= lt!206639 (choose!1338 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> d!74475 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!13981 _keys!709)))))

(assert (=> d!74475 (= (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!745 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) lt!206639)))

(declare-fun b!457054 () Bool)

(declare-fun call!30081 () ListLongMap!7077)

(declare-fun call!30080 () ListLongMap!7077)

(declare-fun e!266934 () Bool)

(assert (=> b!457054 (= e!266934 (= call!30081 (+!1608 call!30080 (tuple2!8175 k0!794 v!412))))))

(declare-fun bm!30077 () Bool)

(assert (=> bm!30077 (= call!30081 (getCurrentListMapNoExtraKeys!1749 (array!28370 (store (arr!13628 _keys!709) i!563 k0!794) (size!13981 _keys!709)) (array!28372 (store (arr!13629 _values!549) i!563 (ValueCellFull!5801 v!412)) (size!13982 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!457055 () Bool)

(assert (=> b!457055 (= e!266934 (= call!30081 call!30080))))

(declare-fun bm!30078 () Bool)

(assert (=> bm!30078 (= call!30080 (getCurrentListMapNoExtraKeys!1749 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!457056 () Bool)

(assert (=> b!457056 (= e!266935 e!266934)))

(declare-fun c!56298 () Bool)

(assert (=> b!457056 (= c!56298 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(assert (= (and d!74475 res!272921) b!457056))

(assert (= (and b!457056 c!56298) b!457054))

(assert (= (and b!457056 (not c!56298)) b!457055))

(assert (= (or b!457054 b!457055) bm!30078))

(assert (= (or b!457054 b!457055) bm!30077))

(declare-fun m!439983 () Bool)

(assert (=> d!74475 m!439983))

(declare-fun m!439985 () Bool)

(assert (=> b!457054 m!439985))

(assert (=> bm!30077 m!439737))

(assert (=> bm!30077 m!439729))

(declare-fun m!439987 () Bool)

(assert (=> bm!30077 m!439987))

(assert (=> bm!30078 m!439713))

(assert (=> b!456835 d!74475))

(declare-fun d!74477 () Bool)

(assert (=> d!74477 (= (validMask!0 mask!1025) (and (or (= mask!1025 #b00000000000000000000000000000111) (= mask!1025 #b00000000000000000000000000001111) (= mask!1025 #b00000000000000000000000000011111) (= mask!1025 #b00000000000000000000000000111111) (= mask!1025 #b00000000000000000000000001111111) (= mask!1025 #b00000000000000000000000011111111) (= mask!1025 #b00000000000000000000000111111111) (= mask!1025 #b00000000000000000000001111111111) (= mask!1025 #b00000000000000000000011111111111) (= mask!1025 #b00000000000000000000111111111111) (= mask!1025 #b00000000000000000001111111111111) (= mask!1025 #b00000000000000000011111111111111) (= mask!1025 #b00000000000000000111111111111111) (= mask!1025 #b00000000000000001111111111111111) (= mask!1025 #b00000000000000011111111111111111) (= mask!1025 #b00000000000000111111111111111111) (= mask!1025 #b00000000000001111111111111111111) (= mask!1025 #b00000000000011111111111111111111) (= mask!1025 #b00000000000111111111111111111111) (= mask!1025 #b00000000001111111111111111111111) (= mask!1025 #b00000000011111111111111111111111) (= mask!1025 #b00000000111111111111111111111111) (= mask!1025 #b00000001111111111111111111111111) (= mask!1025 #b00000011111111111111111111111111) (= mask!1025 #b00000111111111111111111111111111) (= mask!1025 #b00001111111111111111111111111111) (= mask!1025 #b00011111111111111111111111111111) (= mask!1025 #b00111111111111111111111111111111)) (bvsle mask!1025 #b00111111111111111111111111111111)))))

(assert (=> b!456840 d!74477))

(declare-fun b!457067 () Bool)

(declare-fun e!266946 () Bool)

(declare-fun call!30084 () Bool)

(assert (=> b!457067 (= e!266946 call!30084)))

(declare-fun d!74479 () Bool)

(declare-fun res!272929 () Bool)

(declare-fun e!266947 () Bool)

(assert (=> d!74479 (=> res!272929 e!266947)))

(assert (=> d!74479 (= res!272929 (bvsge #b00000000000000000000000000000000 (size!13981 _keys!709)))))

(assert (=> d!74479 (= (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8235) e!266947)))

(declare-fun b!457068 () Bool)

(declare-fun e!266945 () Bool)

(assert (=> b!457068 (= e!266945 e!266946)))

(declare-fun c!56301 () Bool)

(assert (=> b!457068 (= c!56301 (validKeyInArray!0 (select (arr!13628 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun b!457069 () Bool)

(assert (=> b!457069 (= e!266946 call!30084)))

(declare-fun b!457070 () Bool)

(declare-fun e!266944 () Bool)

(declare-fun contains!2491 (List!8238 (_ BitVec 64)) Bool)

(assert (=> b!457070 (= e!266944 (contains!2491 Nil!8235 (select (arr!13628 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun b!457071 () Bool)

(assert (=> b!457071 (= e!266947 e!266945)))

(declare-fun res!272928 () Bool)

(assert (=> b!457071 (=> (not res!272928) (not e!266945))))

(assert (=> b!457071 (= res!272928 (not e!266944))))

(declare-fun res!272930 () Bool)

(assert (=> b!457071 (=> (not res!272930) (not e!266944))))

(assert (=> b!457071 (= res!272930 (validKeyInArray!0 (select (arr!13628 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun bm!30081 () Bool)

(assert (=> bm!30081 (= call!30084 (arrayNoDuplicates!0 _keys!709 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!56301 (Cons!8234 (select (arr!13628 _keys!709) #b00000000000000000000000000000000) Nil!8235) Nil!8235)))))

(assert (= (and d!74479 (not res!272929)) b!457071))

(assert (= (and b!457071 res!272930) b!457070))

(assert (= (and b!457071 res!272928) b!457068))

(assert (= (and b!457068 c!56301) b!457069))

(assert (= (and b!457068 (not c!56301)) b!457067))

(assert (= (or b!457069 b!457067) bm!30081))

(assert (=> b!457068 m!439903))

(assert (=> b!457068 m!439903))

(assert (=> b!457068 m!439911))

(assert (=> b!457070 m!439903))

(assert (=> b!457070 m!439903))

(declare-fun m!439989 () Bool)

(assert (=> b!457070 m!439989))

(assert (=> b!457071 m!439903))

(assert (=> b!457071 m!439903))

(assert (=> b!457071 m!439911))

(assert (=> bm!30081 m!439903))

(declare-fun m!439991 () Bool)

(assert (=> bm!30081 m!439991))

(assert (=> b!456829 d!74479))

(declare-fun bm!30082 () Bool)

(declare-fun call!30085 () Bool)

(assert (=> bm!30082 (= call!30085 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!206522 mask!1025))))

(declare-fun b!457072 () Bool)

(declare-fun e!266950 () Bool)

(declare-fun e!266948 () Bool)

(assert (=> b!457072 (= e!266950 e!266948)))

(declare-fun lt!206642 () (_ BitVec 64))

(assert (=> b!457072 (= lt!206642 (select (arr!13628 lt!206522) #b00000000000000000000000000000000))))

(declare-fun lt!206641 () Unit!13265)

(assert (=> b!457072 (= lt!206641 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!206522 lt!206642 #b00000000000000000000000000000000))))

(assert (=> b!457072 (arrayContainsKey!0 lt!206522 lt!206642 #b00000000000000000000000000000000)))

(declare-fun lt!206640 () Unit!13265)

(assert (=> b!457072 (= lt!206640 lt!206641)))

(declare-fun res!272931 () Bool)

(assert (=> b!457072 (= res!272931 (= (seekEntryOrOpen!0 (select (arr!13628 lt!206522) #b00000000000000000000000000000000) lt!206522 mask!1025) (Found!3528 #b00000000000000000000000000000000)))))

(assert (=> b!457072 (=> (not res!272931) (not e!266948))))

(declare-fun b!457073 () Bool)

(assert (=> b!457073 (= e!266948 call!30085)))

(declare-fun d!74481 () Bool)

(declare-fun res!272932 () Bool)

(declare-fun e!266949 () Bool)

(assert (=> d!74481 (=> res!272932 e!266949)))

(assert (=> d!74481 (= res!272932 (bvsge #b00000000000000000000000000000000 (size!13981 lt!206522)))))

(assert (=> d!74481 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!206522 mask!1025) e!266949)))

(declare-fun b!457074 () Bool)

(assert (=> b!457074 (= e!266950 call!30085)))

(declare-fun b!457075 () Bool)

(assert (=> b!457075 (= e!266949 e!266950)))

(declare-fun c!56302 () Bool)

(assert (=> b!457075 (= c!56302 (validKeyInArray!0 (select (arr!13628 lt!206522) #b00000000000000000000000000000000)))))

(assert (= (and d!74481 (not res!272932)) b!457075))

(assert (= (and b!457075 c!56302) b!457072))

(assert (= (and b!457075 (not c!56302)) b!457074))

(assert (= (and b!457072 res!272931) b!457073))

(assert (= (or b!457073 b!457074) bm!30082))

(declare-fun m!439993 () Bool)

(assert (=> bm!30082 m!439993))

(declare-fun m!439995 () Bool)

(assert (=> b!457072 m!439995))

(declare-fun m!439997 () Bool)

(assert (=> b!457072 m!439997))

(declare-fun m!439999 () Bool)

(assert (=> b!457072 m!439999))

(assert (=> b!457072 m!439995))

(declare-fun m!440001 () Bool)

(assert (=> b!457072 m!440001))

(assert (=> b!457075 m!439995))

(assert (=> b!457075 m!439995))

(declare-fun m!440003 () Bool)

(assert (=> b!457075 m!440003))

(assert (=> b!456839 d!74481))

(declare-fun d!74483 () Bool)

(assert (=> d!74483 (= (validKeyInArray!0 k0!794) (and (not (= k0!794 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!794 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!456838 d!74483))

(declare-fun d!74485 () Bool)

(declare-fun e!266951 () Bool)

(assert (=> d!74485 e!266951))

(declare-fun res!272934 () Bool)

(assert (=> d!74485 (=> (not res!272934) (not e!266951))))

(declare-fun lt!206644 () ListLongMap!7077)

(assert (=> d!74485 (= res!272934 (contains!2489 lt!206644 (_1!4098 (tuple2!8175 (select (arr!13628 _keys!709) from!863) (get!6706 (select (arr!13629 _values!549) from!863) (dynLambda!871 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!206645 () List!8239)

(assert (=> d!74485 (= lt!206644 (ListLongMap!7078 lt!206645))))

(declare-fun lt!206643 () Unit!13265)

(declare-fun lt!206646 () Unit!13265)

(assert (=> d!74485 (= lt!206643 lt!206646)))

(assert (=> d!74485 (= (getValueByKey!369 lt!206645 (_1!4098 (tuple2!8175 (select (arr!13628 _keys!709) from!863) (get!6706 (select (arr!13629 _values!549) from!863) (dynLambda!871 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!374 (_2!4098 (tuple2!8175 (select (arr!13628 _keys!709) from!863) (get!6706 (select (arr!13629 _values!549) from!863) (dynLambda!871 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!74485 (= lt!206646 (lemmaContainsTupThenGetReturnValue!194 lt!206645 (_1!4098 (tuple2!8175 (select (arr!13628 _keys!709) from!863) (get!6706 (select (arr!13629 _values!549) from!863) (dynLambda!871 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!4098 (tuple2!8175 (select (arr!13628 _keys!709) from!863) (get!6706 (select (arr!13629 _values!549) from!863) (dynLambda!871 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!74485 (= lt!206645 (insertStrictlySorted!197 (toList!3554 lt!206519) (_1!4098 (tuple2!8175 (select (arr!13628 _keys!709) from!863) (get!6706 (select (arr!13629 _values!549) from!863) (dynLambda!871 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!4098 (tuple2!8175 (select (arr!13628 _keys!709) from!863) (get!6706 (select (arr!13629 _values!549) from!863) (dynLambda!871 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!74485 (= (+!1608 lt!206519 (tuple2!8175 (select (arr!13628 _keys!709) from!863) (get!6706 (select (arr!13629 _values!549) from!863) (dynLambda!871 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!206644)))

(declare-fun b!457076 () Bool)

(declare-fun res!272933 () Bool)

(assert (=> b!457076 (=> (not res!272933) (not e!266951))))

(assert (=> b!457076 (= res!272933 (= (getValueByKey!369 (toList!3554 lt!206644) (_1!4098 (tuple2!8175 (select (arr!13628 _keys!709) from!863) (get!6706 (select (arr!13629 _values!549) from!863) (dynLambda!871 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!374 (_2!4098 (tuple2!8175 (select (arr!13628 _keys!709) from!863) (get!6706 (select (arr!13629 _values!549) from!863) (dynLambda!871 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!457077 () Bool)

(assert (=> b!457077 (= e!266951 (contains!2490 (toList!3554 lt!206644) (tuple2!8175 (select (arr!13628 _keys!709) from!863) (get!6706 (select (arr!13629 _values!549) from!863) (dynLambda!871 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!74485 res!272934) b!457076))

(assert (= (and b!457076 res!272933) b!457077))

(declare-fun m!440005 () Bool)

(assert (=> d!74485 m!440005))

(declare-fun m!440007 () Bool)

(assert (=> d!74485 m!440007))

(declare-fun m!440009 () Bool)

(assert (=> d!74485 m!440009))

(declare-fun m!440011 () Bool)

(assert (=> d!74485 m!440011))

(declare-fun m!440013 () Bool)

(assert (=> b!457076 m!440013))

(declare-fun m!440015 () Bool)

(assert (=> b!457077 m!440015))

(assert (=> b!456831 d!74485))

(declare-fun d!74487 () Bool)

(declare-fun c!56305 () Bool)

(assert (=> d!74487 (= c!56305 ((_ is ValueCellFull!5801) (select (arr!13629 _values!549) from!863)))))

(declare-fun e!266954 () V!17491)

(assert (=> d!74487 (= (get!6706 (select (arr!13629 _values!549) from!863) (dynLambda!871 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)) e!266954)))

(declare-fun b!457082 () Bool)

(declare-fun get!6708 (ValueCell!5801 V!17491) V!17491)

(assert (=> b!457082 (= e!266954 (get!6708 (select (arr!13629 _values!549) from!863) (dynLambda!871 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!457083 () Bool)

(declare-fun get!6709 (ValueCell!5801 V!17491) V!17491)

(assert (=> b!457083 (= e!266954 (get!6709 (select (arr!13629 _values!549) from!863) (dynLambda!871 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!74487 c!56305) b!457082))

(assert (= (and d!74487 (not c!56305)) b!457083))

(assert (=> b!457082 m!439719))

(assert (=> b!457082 m!439721))

(declare-fun m!440017 () Bool)

(assert (=> b!457082 m!440017))

(assert (=> b!457083 m!439719))

(assert (=> b!457083 m!439721))

(declare-fun m!440019 () Bool)

(assert (=> b!457083 m!440019))

(assert (=> b!456831 d!74487))

(declare-fun d!74489 () Bool)

(assert (=> d!74489 (= (array_inv!9930 _values!549) (bvsge (size!13982 _values!549) #b00000000000000000000000000000000))))

(assert (=> start!41002 d!74489))

(declare-fun d!74491 () Bool)

(assert (=> d!74491 (= (array_inv!9931 _keys!709) (bvsge (size!13981 _keys!709) #b00000000000000000000000000000000))))

(assert (=> start!41002 d!74491))

(declare-fun b!457084 () Bool)

(declare-fun e!266957 () Bool)

(declare-fun call!30086 () Bool)

(assert (=> b!457084 (= e!266957 call!30086)))

(declare-fun d!74493 () Bool)

(declare-fun res!272936 () Bool)

(declare-fun e!266958 () Bool)

(assert (=> d!74493 (=> res!272936 e!266958)))

(assert (=> d!74493 (= res!272936 (bvsge #b00000000000000000000000000000000 (size!13981 lt!206522)))))

(assert (=> d!74493 (= (arrayNoDuplicates!0 lt!206522 #b00000000000000000000000000000000 Nil!8235) e!266958)))

(declare-fun b!457085 () Bool)

(declare-fun e!266956 () Bool)

(assert (=> b!457085 (= e!266956 e!266957)))

(declare-fun c!56306 () Bool)

(assert (=> b!457085 (= c!56306 (validKeyInArray!0 (select (arr!13628 lt!206522) #b00000000000000000000000000000000)))))

(declare-fun b!457086 () Bool)

(assert (=> b!457086 (= e!266957 call!30086)))

(declare-fun b!457087 () Bool)

(declare-fun e!266955 () Bool)

(assert (=> b!457087 (= e!266955 (contains!2491 Nil!8235 (select (arr!13628 lt!206522) #b00000000000000000000000000000000)))))

(declare-fun b!457088 () Bool)

(assert (=> b!457088 (= e!266958 e!266956)))

(declare-fun res!272935 () Bool)

(assert (=> b!457088 (=> (not res!272935) (not e!266956))))

(assert (=> b!457088 (= res!272935 (not e!266955))))

(declare-fun res!272937 () Bool)

(assert (=> b!457088 (=> (not res!272937) (not e!266955))))

(assert (=> b!457088 (= res!272937 (validKeyInArray!0 (select (arr!13628 lt!206522) #b00000000000000000000000000000000)))))

(declare-fun bm!30083 () Bool)

(assert (=> bm!30083 (= call!30086 (arrayNoDuplicates!0 lt!206522 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!56306 (Cons!8234 (select (arr!13628 lt!206522) #b00000000000000000000000000000000) Nil!8235) Nil!8235)))))

(assert (= (and d!74493 (not res!272936)) b!457088))

(assert (= (and b!457088 res!272937) b!457087))

(assert (= (and b!457088 res!272935) b!457085))

(assert (= (and b!457085 c!56306) b!457086))

(assert (= (and b!457085 (not c!56306)) b!457084))

(assert (= (or b!457086 b!457084) bm!30083))

(assert (=> b!457085 m!439995))

(assert (=> b!457085 m!439995))

(assert (=> b!457085 m!440003))

(assert (=> b!457087 m!439995))

(assert (=> b!457087 m!439995))

(declare-fun m!440021 () Bool)

(assert (=> b!457087 m!440021))

(assert (=> b!457088 m!439995))

(assert (=> b!457088 m!439995))

(assert (=> b!457088 m!440003))

(assert (=> bm!30083 m!439995))

(declare-fun m!440023 () Bool)

(assert (=> bm!30083 m!440023))

(assert (=> b!456830 d!74493))

(declare-fun mapNonEmpty!20083 () Bool)

(declare-fun mapRes!20083 () Bool)

(declare-fun tp!38695 () Bool)

(declare-fun e!266963 () Bool)

(assert (=> mapNonEmpty!20083 (= mapRes!20083 (and tp!38695 e!266963))))

(declare-fun mapKey!20083 () (_ BitVec 32))

(declare-fun mapRest!20083 () (Array (_ BitVec 32) ValueCell!5801))

(declare-fun mapValue!20083 () ValueCell!5801)

(assert (=> mapNonEmpty!20083 (= mapRest!20074 (store mapRest!20083 mapKey!20083 mapValue!20083))))

(declare-fun b!457096 () Bool)

(declare-fun e!266964 () Bool)

(assert (=> b!457096 (= e!266964 tp_is_empty!12289)))

(declare-fun condMapEmpty!20083 () Bool)

(declare-fun mapDefault!20083 () ValueCell!5801)

(assert (=> mapNonEmpty!20074 (= condMapEmpty!20083 (= mapRest!20074 ((as const (Array (_ BitVec 32) ValueCell!5801)) mapDefault!20083)))))

(assert (=> mapNonEmpty!20074 (= tp!38679 (and e!266964 mapRes!20083))))

(declare-fun b!457095 () Bool)

(assert (=> b!457095 (= e!266963 tp_is_empty!12289)))

(declare-fun mapIsEmpty!20083 () Bool)

(assert (=> mapIsEmpty!20083 mapRes!20083))

(assert (= (and mapNonEmpty!20074 condMapEmpty!20083) mapIsEmpty!20083))

(assert (= (and mapNonEmpty!20074 (not condMapEmpty!20083)) mapNonEmpty!20083))

(assert (= (and mapNonEmpty!20083 ((_ is ValueCellFull!5801) mapValue!20083)) b!457095))

(assert (= (and mapNonEmpty!20074 ((_ is ValueCellFull!5801) mapDefault!20083)) b!457096))

(declare-fun m!440025 () Bool)

(assert (=> mapNonEmpty!20083 m!440025))

(declare-fun b_lambda!9689 () Bool)

(assert (= b_lambda!9685 (or (and start!41002 b_free!10951) b_lambda!9689)))

(declare-fun b_lambda!9691 () Bool)

(assert (= b_lambda!9675 (or (and start!41002 b_free!10951) b_lambda!9691)))

(declare-fun b_lambda!9693 () Bool)

(assert (= b_lambda!9673 (or (and start!41002 b_free!10951) b_lambda!9693)))

(declare-fun b_lambda!9695 () Bool)

(assert (= b_lambda!9687 (or (and start!41002 b_free!10951) b_lambda!9695)))

(declare-fun b_lambda!9697 () Bool)

(assert (= b_lambda!9679 (or (and start!41002 b_free!10951) b_lambda!9697)))

(declare-fun b_lambda!9699 () Bool)

(assert (= b_lambda!9677 (or (and start!41002 b_free!10951) b_lambda!9699)))

(declare-fun b_lambda!9701 () Bool)

(assert (= b_lambda!9681 (or (and start!41002 b_free!10951) b_lambda!9701)))

(declare-fun b_lambda!9703 () Bool)

(assert (= b_lambda!9683 (or (and start!41002 b_free!10951) b_lambda!9703)))

(check-sat (not b!456981) (not b!456997) (not b!457023) (not b_lambda!9693) (not b!456991) (not b!457075) (not b!457040) (not b_next!10951) (not b!456977) (not b!457041) (not bm!30072) (not bm!30071) (not b!457047) (not bm!30077) (not d!74467) (not b!457087) (not b!456986) (not b!456998) (not b!457008) (not b!457033) (not b!457039) (not b!457077) (not b!457024) (not b!457021) (not mapNonEmpty!20083) (not b!456994) (not b!456995) (not b!456985) (not b!457054) (not d!74475) (not b!457037) (not b!457072) (not bm!30083) (not d!74471) (not b!457028) (not b!456987) (not b!457029) (not b_lambda!9695) (not bm!30067) (not b!457068) (not b!457031) (not b!457082) (not d!74461) (not b!456989) (not b_lambda!9691) (not b!456983) (not b_lambda!9703) (not d!74459) (not b!457027) (not b!457083) (not bm!30070) (not b_lambda!9689) (not b_lambda!9697) (not b_lambda!9699) (not b!457036) (not b!457046) (not b!457017) (not b!456993) tp_is_empty!12289 (not b!457076) (not b!457088) (not b!456979) (not d!74469) (not d!74485) (not b!457085) (not b_lambda!9671) (not b!457019) (not bm!30082) (not b!457071) (not b!457025) (not b!457070) (not b!457011) (not b!457035) (not b!456999) (not bm!30078) (not b_lambda!9701) (not bm!30081) (not b!456982) (not bm!30066) b_and!19093)
(check-sat b_and!19093 (not b_next!10951))

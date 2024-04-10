; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96336 () Bool)

(assert start!96336)

(declare-fun b!1094883 () Bool)

(declare-fun e!625091 () Bool)

(declare-fun e!625087 () Bool)

(declare-fun mapRes!42241 () Bool)

(assert (=> b!1094883 (= e!625091 (and e!625087 mapRes!42241))))

(declare-fun condMapEmpty!42241 () Bool)

(declare-datatypes ((V!41115 0))(
  ( (V!41116 (val!13552 Int)) )
))
(declare-datatypes ((ValueCell!12786 0))(
  ( (ValueCellFull!12786 (v!16173 V!41115)) (EmptyCell!12786) )
))
(declare-datatypes ((array!70895 0))(
  ( (array!70896 (arr!34121 (Array (_ BitVec 32) ValueCell!12786)) (size!34657 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70895)

(declare-fun mapDefault!42241 () ValueCell!12786)

(assert (=> b!1094883 (= condMapEmpty!42241 (= (arr!34121 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12786)) mapDefault!42241)))))

(declare-fun b!1094884 () Bool)

(declare-fun res!730670 () Bool)

(declare-fun e!625089 () Bool)

(assert (=> b!1094884 (=> (not res!730670) (not e!625089))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((array!70897 0))(
  ( (array!70898 (arr!34122 (Array (_ BitVec 32) (_ BitVec 64))) (size!34658 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70897)

(assert (=> b!1094884 (= res!730670 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34658 _keys!1070))))))

(declare-fun b!1094885 () Bool)

(declare-fun e!625086 () Bool)

(assert (=> b!1094885 (= e!625089 e!625086)))

(declare-fun res!730668 () Bool)

(assert (=> b!1094885 (=> (not res!730668) (not e!625086))))

(declare-fun lt!489715 () array!70897)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70897 (_ BitVec 32)) Bool)

(assert (=> b!1094885 (= res!730668 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!489715 mask!1414))))

(assert (=> b!1094885 (= lt!489715 (array!70898 (store (arr!34122 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34658 _keys!1070)))))

(declare-fun b!1094886 () Bool)

(declare-fun res!730672 () Bool)

(assert (=> b!1094886 (=> (not res!730672) (not e!625089))))

(declare-datatypes ((List!23831 0))(
  ( (Nil!23828) (Cons!23827 (h!25036 (_ BitVec 64)) (t!33838 List!23831)) )
))
(declare-fun arrayNoDuplicates!0 (array!70897 (_ BitVec 32) List!23831) Bool)

(assert (=> b!1094886 (= res!730672 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23828))))

(declare-fun b!1094887 () Bool)

(declare-fun tp_is_empty!26991 () Bool)

(assert (=> b!1094887 (= e!625087 tp_is_empty!26991)))

(declare-fun b!1094888 () Bool)

(declare-fun res!730671 () Bool)

(assert (=> b!1094888 (=> (not res!730671) (not e!625089))))

(declare-fun k0!904 () (_ BitVec 64))

(assert (=> b!1094888 (= res!730671 (= (select (arr!34122 _keys!1070) i!650) k0!904))))

(declare-fun b!1094889 () Bool)

(declare-fun e!625088 () Bool)

(assert (=> b!1094889 (= e!625088 tp_is_empty!26991)))

(declare-fun b!1094890 () Bool)

(declare-fun res!730667 () Bool)

(assert (=> b!1094890 (=> (not res!730667) (not e!625089))))

(assert (=> b!1094890 (= res!730667 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1094891 () Bool)

(assert (=> b!1094891 (= e!625086 (bvsge (size!34658 _keys!1070) #b01111111111111111111111111111111))))

(declare-fun mapIsEmpty!42241 () Bool)

(assert (=> mapIsEmpty!42241 mapRes!42241))

(declare-fun res!730669 () Bool)

(assert (=> start!96336 (=> (not res!730669) (not e!625089))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96336 (= res!730669 (validMask!0 mask!1414))))

(assert (=> start!96336 e!625089))

(assert (=> start!96336 true))

(declare-fun array_inv!26294 (array!70897) Bool)

(assert (=> start!96336 (array_inv!26294 _keys!1070)))

(declare-fun array_inv!26295 (array!70895) Bool)

(assert (=> start!96336 (and (array_inv!26295 _values!874) e!625091)))

(declare-fun b!1094892 () Bool)

(declare-fun res!730673 () Bool)

(assert (=> b!1094892 (=> (not res!730673) (not e!625089))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1094892 (= res!730673 (validKeyInArray!0 k0!904))))

(declare-fun b!1094893 () Bool)

(declare-fun res!730674 () Bool)

(assert (=> b!1094893 (=> (not res!730674) (not e!625086))))

(assert (=> b!1094893 (= res!730674 (arrayNoDuplicates!0 lt!489715 #b00000000000000000000000000000000 Nil!23828))))

(declare-fun mapNonEmpty!42241 () Bool)

(declare-fun tp!80756 () Bool)

(assert (=> mapNonEmpty!42241 (= mapRes!42241 (and tp!80756 e!625088))))

(declare-fun mapKey!42241 () (_ BitVec 32))

(declare-fun mapValue!42241 () ValueCell!12786)

(declare-fun mapRest!42241 () (Array (_ BitVec 32) ValueCell!12786))

(assert (=> mapNonEmpty!42241 (= (arr!34121 _values!874) (store mapRest!42241 mapKey!42241 mapValue!42241))))

(declare-fun b!1094894 () Bool)

(declare-fun res!730666 () Bool)

(assert (=> b!1094894 (=> (not res!730666) (not e!625089))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1094894 (= res!730666 (and (= (size!34657 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34658 _keys!1070) (size!34657 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(assert (= (and start!96336 res!730669) b!1094894))

(assert (= (and b!1094894 res!730666) b!1094890))

(assert (= (and b!1094890 res!730667) b!1094886))

(assert (= (and b!1094886 res!730672) b!1094884))

(assert (= (and b!1094884 res!730670) b!1094892))

(assert (= (and b!1094892 res!730673) b!1094888))

(assert (= (and b!1094888 res!730671) b!1094885))

(assert (= (and b!1094885 res!730668) b!1094893))

(assert (= (and b!1094893 res!730674) b!1094891))

(assert (= (and b!1094883 condMapEmpty!42241) mapIsEmpty!42241))

(assert (= (and b!1094883 (not condMapEmpty!42241)) mapNonEmpty!42241))

(get-info :version)

(assert (= (and mapNonEmpty!42241 ((_ is ValueCellFull!12786) mapValue!42241)) b!1094889))

(assert (= (and b!1094883 ((_ is ValueCellFull!12786) mapDefault!42241)) b!1094887))

(assert (= start!96336 b!1094883))

(declare-fun m!1014671 () Bool)

(assert (=> b!1094892 m!1014671))

(declare-fun m!1014673 () Bool)

(assert (=> b!1094885 m!1014673))

(declare-fun m!1014675 () Bool)

(assert (=> b!1094885 m!1014675))

(declare-fun m!1014677 () Bool)

(assert (=> b!1094886 m!1014677))

(declare-fun m!1014679 () Bool)

(assert (=> start!96336 m!1014679))

(declare-fun m!1014681 () Bool)

(assert (=> start!96336 m!1014681))

(declare-fun m!1014683 () Bool)

(assert (=> start!96336 m!1014683))

(declare-fun m!1014685 () Bool)

(assert (=> b!1094893 m!1014685))

(declare-fun m!1014687 () Bool)

(assert (=> b!1094888 m!1014687))

(declare-fun m!1014689 () Bool)

(assert (=> b!1094890 m!1014689))

(declare-fun m!1014691 () Bool)

(assert (=> mapNonEmpty!42241 m!1014691))

(check-sat (not b!1094886) (not start!96336) (not b!1094893) (not b!1094890) (not mapNonEmpty!42241) (not b!1094885) (not b!1094892) tp_is_empty!26991)
(check-sat)
(get-model)

(declare-fun d!130217 () Bool)

(assert (=> d!130217 (= (validMask!0 mask!1414) (and (or (= mask!1414 #b00000000000000000000000000000111) (= mask!1414 #b00000000000000000000000000001111) (= mask!1414 #b00000000000000000000000000011111) (= mask!1414 #b00000000000000000000000000111111) (= mask!1414 #b00000000000000000000000001111111) (= mask!1414 #b00000000000000000000000011111111) (= mask!1414 #b00000000000000000000000111111111) (= mask!1414 #b00000000000000000000001111111111) (= mask!1414 #b00000000000000000000011111111111) (= mask!1414 #b00000000000000000000111111111111) (= mask!1414 #b00000000000000000001111111111111) (= mask!1414 #b00000000000000000011111111111111) (= mask!1414 #b00000000000000000111111111111111) (= mask!1414 #b00000000000000001111111111111111) (= mask!1414 #b00000000000000011111111111111111) (= mask!1414 #b00000000000000111111111111111111) (= mask!1414 #b00000000000001111111111111111111) (= mask!1414 #b00000000000011111111111111111111) (= mask!1414 #b00000000000111111111111111111111) (= mask!1414 #b00000000001111111111111111111111) (= mask!1414 #b00000000011111111111111111111111) (= mask!1414 #b00000000111111111111111111111111) (= mask!1414 #b00000001111111111111111111111111) (= mask!1414 #b00000011111111111111111111111111) (= mask!1414 #b00000111111111111111111111111111) (= mask!1414 #b00001111111111111111111111111111) (= mask!1414 #b00011111111111111111111111111111) (= mask!1414 #b00111111111111111111111111111111)) (bvsle mask!1414 #b00111111111111111111111111111111)))))

(assert (=> start!96336 d!130217))

(declare-fun d!130219 () Bool)

(assert (=> d!130219 (= (array_inv!26294 _keys!1070) (bvsge (size!34658 _keys!1070) #b00000000000000000000000000000000))))

(assert (=> start!96336 d!130219))

(declare-fun d!130221 () Bool)

(assert (=> d!130221 (= (array_inv!26295 _values!874) (bvsge (size!34657 _values!874) #b00000000000000000000000000000000))))

(assert (=> start!96336 d!130221))

(declare-fun b!1094939 () Bool)

(declare-fun e!625116 () Bool)

(declare-fun call!45751 () Bool)

(assert (=> b!1094939 (= e!625116 call!45751)))

(declare-fun bm!45748 () Bool)

(assert (=> bm!45748 (= call!45751 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1070 mask!1414))))

(declare-fun b!1094940 () Bool)

(declare-fun e!625117 () Bool)

(assert (=> b!1094940 (= e!625117 e!625116)))

(declare-fun lt!489726 () (_ BitVec 64))

(assert (=> b!1094940 (= lt!489726 (select (arr!34122 _keys!1070) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!36026 0))(
  ( (Unit!36027) )
))
(declare-fun lt!489725 () Unit!36026)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70897 (_ BitVec 64) (_ BitVec 32)) Unit!36026)

(assert (=> b!1094940 (= lt!489725 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 lt!489726 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!70897 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1094940 (arrayContainsKey!0 _keys!1070 lt!489726 #b00000000000000000000000000000000)))

(declare-fun lt!489727 () Unit!36026)

(assert (=> b!1094940 (= lt!489727 lt!489725)))

(declare-fun res!730706 () Bool)

(declare-datatypes ((SeekEntryResult!9904 0))(
  ( (MissingZero!9904 (index!41987 (_ BitVec 32))) (Found!9904 (index!41988 (_ BitVec 32))) (Intermediate!9904 (undefined!10716 Bool) (index!41989 (_ BitVec 32)) (x!98419 (_ BitVec 32))) (Undefined!9904) (MissingVacant!9904 (index!41990 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!70897 (_ BitVec 32)) SeekEntryResult!9904)

(assert (=> b!1094940 (= res!730706 (= (seekEntryOrOpen!0 (select (arr!34122 _keys!1070) #b00000000000000000000000000000000) _keys!1070 mask!1414) (Found!9904 #b00000000000000000000000000000000)))))

(assert (=> b!1094940 (=> (not res!730706) (not e!625116))))

(declare-fun d!130223 () Bool)

(declare-fun res!730707 () Bool)

(declare-fun e!625118 () Bool)

(assert (=> d!130223 (=> res!730707 e!625118)))

(assert (=> d!130223 (= res!730707 (bvsge #b00000000000000000000000000000000 (size!34658 _keys!1070)))))

(assert (=> d!130223 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414) e!625118)))

(declare-fun b!1094941 () Bool)

(assert (=> b!1094941 (= e!625118 e!625117)))

(declare-fun c!108345 () Bool)

(assert (=> b!1094941 (= c!108345 (validKeyInArray!0 (select (arr!34122 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1094942 () Bool)

(assert (=> b!1094942 (= e!625117 call!45751)))

(assert (= (and d!130223 (not res!730707)) b!1094941))

(assert (= (and b!1094941 c!108345) b!1094940))

(assert (= (and b!1094941 (not c!108345)) b!1094942))

(assert (= (and b!1094940 res!730706) b!1094939))

(assert (= (or b!1094939 b!1094942) bm!45748))

(declare-fun m!1014715 () Bool)

(assert (=> bm!45748 m!1014715))

(declare-fun m!1014717 () Bool)

(assert (=> b!1094940 m!1014717))

(declare-fun m!1014719 () Bool)

(assert (=> b!1094940 m!1014719))

(declare-fun m!1014721 () Bool)

(assert (=> b!1094940 m!1014721))

(assert (=> b!1094940 m!1014717))

(declare-fun m!1014723 () Bool)

(assert (=> b!1094940 m!1014723))

(assert (=> b!1094941 m!1014717))

(assert (=> b!1094941 m!1014717))

(declare-fun m!1014725 () Bool)

(assert (=> b!1094941 m!1014725))

(assert (=> b!1094890 d!130223))

(declare-fun b!1094943 () Bool)

(declare-fun e!625119 () Bool)

(declare-fun call!45752 () Bool)

(assert (=> b!1094943 (= e!625119 call!45752)))

(declare-fun bm!45749 () Bool)

(assert (=> bm!45749 (= call!45752 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!489715 mask!1414))))

(declare-fun b!1094944 () Bool)

(declare-fun e!625120 () Bool)

(assert (=> b!1094944 (= e!625120 e!625119)))

(declare-fun lt!489729 () (_ BitVec 64))

(assert (=> b!1094944 (= lt!489729 (select (arr!34122 lt!489715) #b00000000000000000000000000000000))))

(declare-fun lt!489728 () Unit!36026)

(assert (=> b!1094944 (= lt!489728 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!489715 lt!489729 #b00000000000000000000000000000000))))

(assert (=> b!1094944 (arrayContainsKey!0 lt!489715 lt!489729 #b00000000000000000000000000000000)))

(declare-fun lt!489730 () Unit!36026)

(assert (=> b!1094944 (= lt!489730 lt!489728)))

(declare-fun res!730708 () Bool)

(assert (=> b!1094944 (= res!730708 (= (seekEntryOrOpen!0 (select (arr!34122 lt!489715) #b00000000000000000000000000000000) lt!489715 mask!1414) (Found!9904 #b00000000000000000000000000000000)))))

(assert (=> b!1094944 (=> (not res!730708) (not e!625119))))

(declare-fun d!130225 () Bool)

(declare-fun res!730709 () Bool)

(declare-fun e!625121 () Bool)

(assert (=> d!130225 (=> res!730709 e!625121)))

(assert (=> d!130225 (= res!730709 (bvsge #b00000000000000000000000000000000 (size!34658 lt!489715)))))

(assert (=> d!130225 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!489715 mask!1414) e!625121)))

(declare-fun b!1094945 () Bool)

(assert (=> b!1094945 (= e!625121 e!625120)))

(declare-fun c!108346 () Bool)

(assert (=> b!1094945 (= c!108346 (validKeyInArray!0 (select (arr!34122 lt!489715) #b00000000000000000000000000000000)))))

(declare-fun b!1094946 () Bool)

(assert (=> b!1094946 (= e!625120 call!45752)))

(assert (= (and d!130225 (not res!730709)) b!1094945))

(assert (= (and b!1094945 c!108346) b!1094944))

(assert (= (and b!1094945 (not c!108346)) b!1094946))

(assert (= (and b!1094944 res!730708) b!1094943))

(assert (= (or b!1094943 b!1094946) bm!45749))

(declare-fun m!1014727 () Bool)

(assert (=> bm!45749 m!1014727))

(declare-fun m!1014729 () Bool)

(assert (=> b!1094944 m!1014729))

(declare-fun m!1014731 () Bool)

(assert (=> b!1094944 m!1014731))

(declare-fun m!1014733 () Bool)

(assert (=> b!1094944 m!1014733))

(assert (=> b!1094944 m!1014729))

(declare-fun m!1014735 () Bool)

(assert (=> b!1094944 m!1014735))

(assert (=> b!1094945 m!1014729))

(assert (=> b!1094945 m!1014729))

(declare-fun m!1014737 () Bool)

(assert (=> b!1094945 m!1014737))

(assert (=> b!1094885 d!130225))

(declare-fun b!1094957 () Bool)

(declare-fun e!625132 () Bool)

(declare-fun call!45755 () Bool)

(assert (=> b!1094957 (= e!625132 call!45755)))

(declare-fun b!1094958 () Bool)

(declare-fun e!625130 () Bool)

(declare-fun contains!6375 (List!23831 (_ BitVec 64)) Bool)

(assert (=> b!1094958 (= e!625130 (contains!6375 Nil!23828 (select (arr!34122 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun d!130227 () Bool)

(declare-fun res!730717 () Bool)

(declare-fun e!625131 () Bool)

(assert (=> d!130227 (=> res!730717 e!625131)))

(assert (=> d!130227 (= res!730717 (bvsge #b00000000000000000000000000000000 (size!34658 _keys!1070)))))

(assert (=> d!130227 (= (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23828) e!625131)))

(declare-fun b!1094959 () Bool)

(declare-fun e!625133 () Bool)

(assert (=> b!1094959 (= e!625131 e!625133)))

(declare-fun res!730716 () Bool)

(assert (=> b!1094959 (=> (not res!730716) (not e!625133))))

(assert (=> b!1094959 (= res!730716 (not e!625130))))

(declare-fun res!730718 () Bool)

(assert (=> b!1094959 (=> (not res!730718) (not e!625130))))

(assert (=> b!1094959 (= res!730718 (validKeyInArray!0 (select (arr!34122 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun bm!45752 () Bool)

(declare-fun c!108349 () Bool)

(assert (=> bm!45752 (= call!45755 (arrayNoDuplicates!0 _keys!1070 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!108349 (Cons!23827 (select (arr!34122 _keys!1070) #b00000000000000000000000000000000) Nil!23828) Nil!23828)))))

(declare-fun b!1094960 () Bool)

(assert (=> b!1094960 (= e!625132 call!45755)))

(declare-fun b!1094961 () Bool)

(assert (=> b!1094961 (= e!625133 e!625132)))

(assert (=> b!1094961 (= c!108349 (validKeyInArray!0 (select (arr!34122 _keys!1070) #b00000000000000000000000000000000)))))

(assert (= (and d!130227 (not res!730717)) b!1094959))

(assert (= (and b!1094959 res!730718) b!1094958))

(assert (= (and b!1094959 res!730716) b!1094961))

(assert (= (and b!1094961 c!108349) b!1094957))

(assert (= (and b!1094961 (not c!108349)) b!1094960))

(assert (= (or b!1094957 b!1094960) bm!45752))

(assert (=> b!1094958 m!1014717))

(assert (=> b!1094958 m!1014717))

(declare-fun m!1014739 () Bool)

(assert (=> b!1094958 m!1014739))

(assert (=> b!1094959 m!1014717))

(assert (=> b!1094959 m!1014717))

(assert (=> b!1094959 m!1014725))

(assert (=> bm!45752 m!1014717))

(declare-fun m!1014741 () Bool)

(assert (=> bm!45752 m!1014741))

(assert (=> b!1094961 m!1014717))

(assert (=> b!1094961 m!1014717))

(assert (=> b!1094961 m!1014725))

(assert (=> b!1094886 d!130227))

(declare-fun d!130229 () Bool)

(assert (=> d!130229 (= (validKeyInArray!0 k0!904) (and (not (= k0!904 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!904 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1094892 d!130229))

(declare-fun b!1094962 () Bool)

(declare-fun e!625136 () Bool)

(declare-fun call!45756 () Bool)

(assert (=> b!1094962 (= e!625136 call!45756)))

(declare-fun b!1094963 () Bool)

(declare-fun e!625134 () Bool)

(assert (=> b!1094963 (= e!625134 (contains!6375 Nil!23828 (select (arr!34122 lt!489715) #b00000000000000000000000000000000)))))

(declare-fun d!130231 () Bool)

(declare-fun res!730720 () Bool)

(declare-fun e!625135 () Bool)

(assert (=> d!130231 (=> res!730720 e!625135)))

(assert (=> d!130231 (= res!730720 (bvsge #b00000000000000000000000000000000 (size!34658 lt!489715)))))

(assert (=> d!130231 (= (arrayNoDuplicates!0 lt!489715 #b00000000000000000000000000000000 Nil!23828) e!625135)))

(declare-fun b!1094964 () Bool)

(declare-fun e!625137 () Bool)

(assert (=> b!1094964 (= e!625135 e!625137)))

(declare-fun res!730719 () Bool)

(assert (=> b!1094964 (=> (not res!730719) (not e!625137))))

(assert (=> b!1094964 (= res!730719 (not e!625134))))

(declare-fun res!730721 () Bool)

(assert (=> b!1094964 (=> (not res!730721) (not e!625134))))

(assert (=> b!1094964 (= res!730721 (validKeyInArray!0 (select (arr!34122 lt!489715) #b00000000000000000000000000000000)))))

(declare-fun bm!45753 () Bool)

(declare-fun c!108350 () Bool)

(assert (=> bm!45753 (= call!45756 (arrayNoDuplicates!0 lt!489715 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!108350 (Cons!23827 (select (arr!34122 lt!489715) #b00000000000000000000000000000000) Nil!23828) Nil!23828)))))

(declare-fun b!1094965 () Bool)

(assert (=> b!1094965 (= e!625136 call!45756)))

(declare-fun b!1094966 () Bool)

(assert (=> b!1094966 (= e!625137 e!625136)))

(assert (=> b!1094966 (= c!108350 (validKeyInArray!0 (select (arr!34122 lt!489715) #b00000000000000000000000000000000)))))

(assert (= (and d!130231 (not res!730720)) b!1094964))

(assert (= (and b!1094964 res!730721) b!1094963))

(assert (= (and b!1094964 res!730719) b!1094966))

(assert (= (and b!1094966 c!108350) b!1094962))

(assert (= (and b!1094966 (not c!108350)) b!1094965))

(assert (= (or b!1094962 b!1094965) bm!45753))

(assert (=> b!1094963 m!1014729))

(assert (=> b!1094963 m!1014729))

(declare-fun m!1014743 () Bool)

(assert (=> b!1094963 m!1014743))

(assert (=> b!1094964 m!1014729))

(assert (=> b!1094964 m!1014729))

(assert (=> b!1094964 m!1014737))

(assert (=> bm!45753 m!1014729))

(declare-fun m!1014745 () Bool)

(assert (=> bm!45753 m!1014745))

(assert (=> b!1094966 m!1014729))

(assert (=> b!1094966 m!1014729))

(assert (=> b!1094966 m!1014737))

(assert (=> b!1094893 d!130231))

(declare-fun b!1094973 () Bool)

(declare-fun e!625143 () Bool)

(assert (=> b!1094973 (= e!625143 tp_is_empty!26991)))

(declare-fun mapNonEmpty!42247 () Bool)

(declare-fun mapRes!42247 () Bool)

(declare-fun tp!80762 () Bool)

(assert (=> mapNonEmpty!42247 (= mapRes!42247 (and tp!80762 e!625143))))

(declare-fun mapKey!42247 () (_ BitVec 32))

(declare-fun mapValue!42247 () ValueCell!12786)

(declare-fun mapRest!42247 () (Array (_ BitVec 32) ValueCell!12786))

(assert (=> mapNonEmpty!42247 (= mapRest!42241 (store mapRest!42247 mapKey!42247 mapValue!42247))))

(declare-fun mapIsEmpty!42247 () Bool)

(assert (=> mapIsEmpty!42247 mapRes!42247))

(declare-fun b!1094974 () Bool)

(declare-fun e!625142 () Bool)

(assert (=> b!1094974 (= e!625142 tp_is_empty!26991)))

(declare-fun condMapEmpty!42247 () Bool)

(declare-fun mapDefault!42247 () ValueCell!12786)

(assert (=> mapNonEmpty!42241 (= condMapEmpty!42247 (= mapRest!42241 ((as const (Array (_ BitVec 32) ValueCell!12786)) mapDefault!42247)))))

(assert (=> mapNonEmpty!42241 (= tp!80756 (and e!625142 mapRes!42247))))

(assert (= (and mapNonEmpty!42241 condMapEmpty!42247) mapIsEmpty!42247))

(assert (= (and mapNonEmpty!42241 (not condMapEmpty!42247)) mapNonEmpty!42247))

(assert (= (and mapNonEmpty!42247 ((_ is ValueCellFull!12786) mapValue!42247)) b!1094973))

(assert (= (and mapNonEmpty!42241 ((_ is ValueCellFull!12786) mapDefault!42247)) b!1094974))

(declare-fun m!1014747 () Bool)

(assert (=> mapNonEmpty!42247 m!1014747))

(check-sat (not bm!45753) (not b!1094959) (not mapNonEmpty!42247) (not b!1094940) (not b!1094964) (not b!1094966) (not b!1094941) (not bm!45752) (not b!1094944) (not bm!45748) (not bm!45749) (not b!1094963) (not b!1094945) (not b!1094961) tp_is_empty!26991 (not b!1094958))
(check-sat)

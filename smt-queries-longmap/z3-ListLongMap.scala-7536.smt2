; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95514 () Bool)

(assert start!95514)

(declare-fun b!1078714 () Bool)

(declare-fun e!616748 () Bool)

(declare-fun tp_is_empty!26191 () Bool)

(assert (=> b!1078714 (= e!616748 tp_is_empty!26191)))

(declare-fun mapNonEmpty!41038 () Bool)

(declare-fun mapRes!41038 () Bool)

(declare-fun tp!78500 () Bool)

(declare-fun e!616745 () Bool)

(assert (=> mapNonEmpty!41038 (= mapRes!41038 (and tp!78500 e!616745))))

(declare-fun mapKey!41038 () (_ BitVec 32))

(declare-datatypes ((V!40049 0))(
  ( (V!40050 (val!13152 Int)) )
))
(declare-datatypes ((ValueCell!12386 0))(
  ( (ValueCellFull!12386 (v!15772 V!40049)) (EmptyCell!12386) )
))
(declare-datatypes ((array!69266 0))(
  ( (array!69267 (arr!33308 (Array (_ BitVec 32) ValueCell!12386)) (size!33846 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69266)

(declare-fun mapRest!41038 () (Array (_ BitVec 32) ValueCell!12386))

(declare-fun mapValue!41038 () ValueCell!12386)

(assert (=> mapNonEmpty!41038 (= (arr!33308 _values!874) (store mapRest!41038 mapKey!41038 mapValue!41038))))

(declare-fun b!1078715 () Bool)

(declare-fun res!718858 () Bool)

(declare-fun e!616746 () Bool)

(assert (=> b!1078715 (=> (not res!718858) (not e!616746))))

(declare-datatypes ((array!69268 0))(
  ( (array!69269 (arr!33309 (Array (_ BitVec 32) (_ BitVec 64))) (size!33847 (_ BitVec 32))) )
))
(declare-fun lt!478511 () array!69268)

(declare-datatypes ((List!23300 0))(
  ( (Nil!23297) (Cons!23296 (h!24505 (_ BitVec 64)) (t!32650 List!23300)) )
))
(declare-fun arrayNoDuplicates!0 (array!69268 (_ BitVec 32) List!23300) Bool)

(assert (=> b!1078715 (= res!718858 (arrayNoDuplicates!0 lt!478511 #b00000000000000000000000000000000 Nil!23297))))

(declare-fun b!1078716 () Bool)

(declare-fun e!616750 () Bool)

(assert (=> b!1078716 (= e!616750 e!616746)))

(declare-fun res!718857 () Bool)

(assert (=> b!1078716 (=> (not res!718857) (not e!616746))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69268 (_ BitVec 32)) Bool)

(assert (=> b!1078716 (= res!718857 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!478511 mask!1414))))

(declare-fun _keys!1070 () array!69268)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1078716 (= lt!478511 (array!69269 (store (arr!33309 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33847 _keys!1070)))))

(declare-fun res!718856 () Bool)

(assert (=> start!95514 (=> (not res!718856) (not e!616750))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95514 (= res!718856 (validMask!0 mask!1414))))

(assert (=> start!95514 e!616750))

(assert (=> start!95514 true))

(declare-fun array_inv!25756 (array!69268) Bool)

(assert (=> start!95514 (array_inv!25756 _keys!1070)))

(declare-fun e!616747 () Bool)

(declare-fun array_inv!25757 (array!69266) Bool)

(assert (=> start!95514 (and (array_inv!25757 _values!874) e!616747)))

(declare-fun b!1078717 () Bool)

(declare-fun res!718859 () Bool)

(assert (=> b!1078717 (=> (not res!718859) (not e!616750))))

(assert (=> b!1078717 (= res!718859 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!33847 _keys!1070))))))

(declare-fun b!1078718 () Bool)

(assert (=> b!1078718 (= e!616747 (and e!616748 mapRes!41038))))

(declare-fun condMapEmpty!41038 () Bool)

(declare-fun mapDefault!41038 () ValueCell!12386)

(assert (=> b!1078718 (= condMapEmpty!41038 (= (arr!33308 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12386)) mapDefault!41038)))))

(declare-fun b!1078719 () Bool)

(declare-fun res!718860 () Bool)

(assert (=> b!1078719 (=> (not res!718860) (not e!616750))))

(assert (=> b!1078719 (= res!718860 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1078720 () Bool)

(declare-fun res!718854 () Bool)

(assert (=> b!1078720 (=> (not res!718854) (not e!616750))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1078720 (= res!718854 (validKeyInArray!0 k0!904))))

(declare-fun b!1078721 () Bool)

(declare-fun res!718855 () Bool)

(assert (=> b!1078721 (=> (not res!718855) (not e!616750))))

(assert (=> b!1078721 (= res!718855 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23297))))

(declare-fun mapIsEmpty!41038 () Bool)

(assert (=> mapIsEmpty!41038 mapRes!41038))

(declare-fun b!1078722 () Bool)

(declare-fun res!718861 () Bool)

(assert (=> b!1078722 (=> (not res!718861) (not e!616750))))

(assert (=> b!1078722 (= res!718861 (= (select (arr!33309 _keys!1070) i!650) k0!904))))

(declare-fun b!1078723 () Bool)

(assert (=> b!1078723 (= e!616746 (not (or (bvsge #b00000000000000000000000000000000 (size!33847 _keys!1070)) (bvslt (size!33847 _keys!1070) #b01111111111111111111111111111111))))))

(declare-fun arrayContainsKey!0 (array!69268 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1078723 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35317 0))(
  ( (Unit!35318) )
))
(declare-fun lt!478510 () Unit!35317)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69268 (_ BitVec 64) (_ BitVec 32)) Unit!35317)

(assert (=> b!1078723 (= lt!478510 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1078724 () Bool)

(declare-fun res!718853 () Bool)

(assert (=> b!1078724 (=> (not res!718853) (not e!616750))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1078724 (= res!718853 (and (= (size!33846 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33847 _keys!1070) (size!33846 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1078725 () Bool)

(assert (=> b!1078725 (= e!616745 tp_is_empty!26191)))

(assert (= (and start!95514 res!718856) b!1078724))

(assert (= (and b!1078724 res!718853) b!1078719))

(assert (= (and b!1078719 res!718860) b!1078721))

(assert (= (and b!1078721 res!718855) b!1078717))

(assert (= (and b!1078717 res!718859) b!1078720))

(assert (= (and b!1078720 res!718854) b!1078722))

(assert (= (and b!1078722 res!718861) b!1078716))

(assert (= (and b!1078716 res!718857) b!1078715))

(assert (= (and b!1078715 res!718858) b!1078723))

(assert (= (and b!1078718 condMapEmpty!41038) mapIsEmpty!41038))

(assert (= (and b!1078718 (not condMapEmpty!41038)) mapNonEmpty!41038))

(get-info :version)

(assert (= (and mapNonEmpty!41038 ((_ is ValueCellFull!12386) mapValue!41038)) b!1078725))

(assert (= (and b!1078718 ((_ is ValueCellFull!12386) mapDefault!41038)) b!1078714))

(assert (= start!95514 b!1078718))

(declare-fun m!996609 () Bool)

(assert (=> b!1078723 m!996609))

(declare-fun m!996611 () Bool)

(assert (=> b!1078723 m!996611))

(declare-fun m!996613 () Bool)

(assert (=> b!1078721 m!996613))

(declare-fun m!996615 () Bool)

(assert (=> mapNonEmpty!41038 m!996615))

(declare-fun m!996617 () Bool)

(assert (=> start!95514 m!996617))

(declare-fun m!996619 () Bool)

(assert (=> start!95514 m!996619))

(declare-fun m!996621 () Bool)

(assert (=> start!95514 m!996621))

(declare-fun m!996623 () Bool)

(assert (=> b!1078715 m!996623))

(declare-fun m!996625 () Bool)

(assert (=> b!1078719 m!996625))

(declare-fun m!996627 () Bool)

(assert (=> b!1078722 m!996627))

(declare-fun m!996629 () Bool)

(assert (=> b!1078716 m!996629))

(declare-fun m!996631 () Bool)

(assert (=> b!1078716 m!996631))

(declare-fun m!996633 () Bool)

(assert (=> b!1078720 m!996633))

(check-sat (not b!1078723) (not b!1078715) (not b!1078716) tp_is_empty!26191 (not b!1078720) (not b!1078721) (not b!1078719) (not start!95514) (not mapNonEmpty!41038))
(check-sat)
(get-model)

(declare-fun d!129775 () Bool)

(declare-fun res!718920 () Bool)

(declare-fun e!616791 () Bool)

(assert (=> d!129775 (=> res!718920 e!616791)))

(assert (=> d!129775 (= res!718920 (= (select (arr!33309 _keys!1070) #b00000000000000000000000000000000) k0!904))))

(assert (=> d!129775 (= (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000) e!616791)))

(declare-fun b!1078802 () Bool)

(declare-fun e!616792 () Bool)

(assert (=> b!1078802 (= e!616791 e!616792)))

(declare-fun res!718921 () Bool)

(assert (=> b!1078802 (=> (not res!718921) (not e!616792))))

(assert (=> b!1078802 (= res!718921 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!33847 _keys!1070)))))

(declare-fun b!1078803 () Bool)

(assert (=> b!1078803 (= e!616792 (arrayContainsKey!0 _keys!1070 k0!904 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!129775 (not res!718920)) b!1078802))

(assert (= (and b!1078802 res!718921) b!1078803))

(declare-fun m!996687 () Bool)

(assert (=> d!129775 m!996687))

(declare-fun m!996689 () Bool)

(assert (=> b!1078803 m!996689))

(assert (=> b!1078723 d!129775))

(declare-fun d!129777 () Bool)

(assert (=> d!129777 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!478526 () Unit!35317)

(declare-fun choose!13 (array!69268 (_ BitVec 64) (_ BitVec 32)) Unit!35317)

(assert (=> d!129777 (= lt!478526 (choose!13 _keys!1070 k0!904 i!650))))

(assert (=> d!129777 (bvsge i!650 #b00000000000000000000000000000000)))

(assert (=> d!129777 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650) lt!478526)))

(declare-fun bs!31762 () Bool)

(assert (= bs!31762 d!129777))

(assert (=> bs!31762 m!996609))

(declare-fun m!996691 () Bool)

(assert (=> bs!31762 m!996691))

(assert (=> b!1078723 d!129777))

(declare-fun b!1078813 () Bool)

(declare-fun e!616801 () Bool)

(declare-fun call!45720 () Bool)

(assert (=> b!1078813 (= e!616801 call!45720)))

(declare-fun b!1078814 () Bool)

(declare-fun e!616799 () Bool)

(assert (=> b!1078814 (= e!616799 e!616801)))

(declare-fun lt!478533 () (_ BitVec 64))

(assert (=> b!1078814 (= lt!478533 (select (arr!33309 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!478535 () Unit!35317)

(assert (=> b!1078814 (= lt!478535 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 lt!478533 #b00000000000000000000000000000000))))

(assert (=> b!1078814 (arrayContainsKey!0 _keys!1070 lt!478533 #b00000000000000000000000000000000)))

(declare-fun lt!478534 () Unit!35317)

(assert (=> b!1078814 (= lt!478534 lt!478535)))

(declare-fun res!718927 () Bool)

(declare-datatypes ((SeekEntryResult!9902 0))(
  ( (MissingZero!9902 (index!41979 (_ BitVec 32))) (Found!9902 (index!41980 (_ BitVec 32))) (Intermediate!9902 (undefined!10714 Bool) (index!41981 (_ BitVec 32)) (x!96700 (_ BitVec 32))) (Undefined!9902) (MissingVacant!9902 (index!41982 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!69268 (_ BitVec 32)) SeekEntryResult!9902)

(assert (=> b!1078814 (= res!718927 (= (seekEntryOrOpen!0 (select (arr!33309 _keys!1070) #b00000000000000000000000000000000) _keys!1070 mask!1414) (Found!9902 #b00000000000000000000000000000000)))))

(assert (=> b!1078814 (=> (not res!718927) (not e!616801))))

(declare-fun bm!45717 () Bool)

(assert (=> bm!45717 (= call!45720 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1070 mask!1414))))

(declare-fun b!1078815 () Bool)

(declare-fun e!616800 () Bool)

(assert (=> b!1078815 (= e!616800 e!616799)))

(declare-fun c!108298 () Bool)

(assert (=> b!1078815 (= c!108298 (validKeyInArray!0 (select (arr!33309 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1078812 () Bool)

(assert (=> b!1078812 (= e!616799 call!45720)))

(declare-fun d!129779 () Bool)

(declare-fun res!718926 () Bool)

(assert (=> d!129779 (=> res!718926 e!616800)))

(assert (=> d!129779 (= res!718926 (bvsge #b00000000000000000000000000000000 (size!33847 _keys!1070)))))

(assert (=> d!129779 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414) e!616800)))

(assert (= (and d!129779 (not res!718926)) b!1078815))

(assert (= (and b!1078815 c!108298) b!1078814))

(assert (= (and b!1078815 (not c!108298)) b!1078812))

(assert (= (and b!1078814 res!718927) b!1078813))

(assert (= (or b!1078813 b!1078812) bm!45717))

(assert (=> b!1078814 m!996687))

(declare-fun m!996693 () Bool)

(assert (=> b!1078814 m!996693))

(declare-fun m!996695 () Bool)

(assert (=> b!1078814 m!996695))

(assert (=> b!1078814 m!996687))

(declare-fun m!996697 () Bool)

(assert (=> b!1078814 m!996697))

(declare-fun m!996699 () Bool)

(assert (=> bm!45717 m!996699))

(assert (=> b!1078815 m!996687))

(assert (=> b!1078815 m!996687))

(declare-fun m!996701 () Bool)

(assert (=> b!1078815 m!996701))

(assert (=> b!1078719 d!129779))

(declare-fun d!129781 () Bool)

(assert (=> d!129781 (= (validKeyInArray!0 k0!904) (and (not (= k0!904 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!904 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1078720 d!129781))

(declare-fun b!1078826 () Bool)

(declare-fun e!616811 () Bool)

(declare-fun e!616810 () Bool)

(assert (=> b!1078826 (= e!616811 e!616810)))

(declare-fun c!108301 () Bool)

(assert (=> b!1078826 (= c!108301 (validKeyInArray!0 (select (arr!33309 lt!478511) #b00000000000000000000000000000000)))))

(declare-fun b!1078827 () Bool)

(declare-fun e!616813 () Bool)

(assert (=> b!1078827 (= e!616813 e!616811)))

(declare-fun res!718934 () Bool)

(assert (=> b!1078827 (=> (not res!718934) (not e!616811))))

(declare-fun e!616812 () Bool)

(assert (=> b!1078827 (= res!718934 (not e!616812))))

(declare-fun res!718936 () Bool)

(assert (=> b!1078827 (=> (not res!718936) (not e!616812))))

(assert (=> b!1078827 (= res!718936 (validKeyInArray!0 (select (arr!33309 lt!478511) #b00000000000000000000000000000000)))))

(declare-fun b!1078829 () Bool)

(declare-fun contains!6344 (List!23300 (_ BitVec 64)) Bool)

(assert (=> b!1078829 (= e!616812 (contains!6344 Nil!23297 (select (arr!33309 lt!478511) #b00000000000000000000000000000000)))))

(declare-fun bm!45720 () Bool)

(declare-fun call!45723 () Bool)

(assert (=> bm!45720 (= call!45723 (arrayNoDuplicates!0 lt!478511 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!108301 (Cons!23296 (select (arr!33309 lt!478511) #b00000000000000000000000000000000) Nil!23297) Nil!23297)))))

(declare-fun b!1078830 () Bool)

(assert (=> b!1078830 (= e!616810 call!45723)))

(declare-fun d!129783 () Bool)

(declare-fun res!718935 () Bool)

(assert (=> d!129783 (=> res!718935 e!616813)))

(assert (=> d!129783 (= res!718935 (bvsge #b00000000000000000000000000000000 (size!33847 lt!478511)))))

(assert (=> d!129783 (= (arrayNoDuplicates!0 lt!478511 #b00000000000000000000000000000000 Nil!23297) e!616813)))

(declare-fun b!1078828 () Bool)

(assert (=> b!1078828 (= e!616810 call!45723)))

(assert (= (and d!129783 (not res!718935)) b!1078827))

(assert (= (and b!1078827 res!718936) b!1078829))

(assert (= (and b!1078827 res!718934) b!1078826))

(assert (= (and b!1078826 c!108301) b!1078828))

(assert (= (and b!1078826 (not c!108301)) b!1078830))

(assert (= (or b!1078828 b!1078830) bm!45720))

(declare-fun m!996703 () Bool)

(assert (=> b!1078826 m!996703))

(assert (=> b!1078826 m!996703))

(declare-fun m!996705 () Bool)

(assert (=> b!1078826 m!996705))

(assert (=> b!1078827 m!996703))

(assert (=> b!1078827 m!996703))

(assert (=> b!1078827 m!996705))

(assert (=> b!1078829 m!996703))

(assert (=> b!1078829 m!996703))

(declare-fun m!996707 () Bool)

(assert (=> b!1078829 m!996707))

(assert (=> bm!45720 m!996703))

(declare-fun m!996709 () Bool)

(assert (=> bm!45720 m!996709))

(assert (=> b!1078715 d!129783))

(declare-fun b!1078831 () Bool)

(declare-fun e!616815 () Bool)

(declare-fun e!616814 () Bool)

(assert (=> b!1078831 (= e!616815 e!616814)))

(declare-fun c!108302 () Bool)

(assert (=> b!1078831 (= c!108302 (validKeyInArray!0 (select (arr!33309 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1078832 () Bool)

(declare-fun e!616817 () Bool)

(assert (=> b!1078832 (= e!616817 e!616815)))

(declare-fun res!718937 () Bool)

(assert (=> b!1078832 (=> (not res!718937) (not e!616815))))

(declare-fun e!616816 () Bool)

(assert (=> b!1078832 (= res!718937 (not e!616816))))

(declare-fun res!718939 () Bool)

(assert (=> b!1078832 (=> (not res!718939) (not e!616816))))

(assert (=> b!1078832 (= res!718939 (validKeyInArray!0 (select (arr!33309 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1078834 () Bool)

(assert (=> b!1078834 (= e!616816 (contains!6344 Nil!23297 (select (arr!33309 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun bm!45721 () Bool)

(declare-fun call!45724 () Bool)

(assert (=> bm!45721 (= call!45724 (arrayNoDuplicates!0 _keys!1070 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!108302 (Cons!23296 (select (arr!33309 _keys!1070) #b00000000000000000000000000000000) Nil!23297) Nil!23297)))))

(declare-fun b!1078835 () Bool)

(assert (=> b!1078835 (= e!616814 call!45724)))

(declare-fun d!129785 () Bool)

(declare-fun res!718938 () Bool)

(assert (=> d!129785 (=> res!718938 e!616817)))

(assert (=> d!129785 (= res!718938 (bvsge #b00000000000000000000000000000000 (size!33847 _keys!1070)))))

(assert (=> d!129785 (= (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23297) e!616817)))

(declare-fun b!1078833 () Bool)

(assert (=> b!1078833 (= e!616814 call!45724)))

(assert (= (and d!129785 (not res!718938)) b!1078832))

(assert (= (and b!1078832 res!718939) b!1078834))

(assert (= (and b!1078832 res!718937) b!1078831))

(assert (= (and b!1078831 c!108302) b!1078833))

(assert (= (and b!1078831 (not c!108302)) b!1078835))

(assert (= (or b!1078833 b!1078835) bm!45721))

(assert (=> b!1078831 m!996687))

(assert (=> b!1078831 m!996687))

(assert (=> b!1078831 m!996701))

(assert (=> b!1078832 m!996687))

(assert (=> b!1078832 m!996687))

(assert (=> b!1078832 m!996701))

(assert (=> b!1078834 m!996687))

(assert (=> b!1078834 m!996687))

(declare-fun m!996711 () Bool)

(assert (=> b!1078834 m!996711))

(assert (=> bm!45721 m!996687))

(declare-fun m!996713 () Bool)

(assert (=> bm!45721 m!996713))

(assert (=> b!1078721 d!129785))

(declare-fun b!1078837 () Bool)

(declare-fun e!616820 () Bool)

(declare-fun call!45725 () Bool)

(assert (=> b!1078837 (= e!616820 call!45725)))

(declare-fun b!1078838 () Bool)

(declare-fun e!616818 () Bool)

(assert (=> b!1078838 (= e!616818 e!616820)))

(declare-fun lt!478536 () (_ BitVec 64))

(assert (=> b!1078838 (= lt!478536 (select (arr!33309 lt!478511) #b00000000000000000000000000000000))))

(declare-fun lt!478538 () Unit!35317)

(assert (=> b!1078838 (= lt!478538 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!478511 lt!478536 #b00000000000000000000000000000000))))

(assert (=> b!1078838 (arrayContainsKey!0 lt!478511 lt!478536 #b00000000000000000000000000000000)))

(declare-fun lt!478537 () Unit!35317)

(assert (=> b!1078838 (= lt!478537 lt!478538)))

(declare-fun res!718941 () Bool)

(assert (=> b!1078838 (= res!718941 (= (seekEntryOrOpen!0 (select (arr!33309 lt!478511) #b00000000000000000000000000000000) lt!478511 mask!1414) (Found!9902 #b00000000000000000000000000000000)))))

(assert (=> b!1078838 (=> (not res!718941) (not e!616820))))

(declare-fun bm!45722 () Bool)

(assert (=> bm!45722 (= call!45725 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!478511 mask!1414))))

(declare-fun b!1078839 () Bool)

(declare-fun e!616819 () Bool)

(assert (=> b!1078839 (= e!616819 e!616818)))

(declare-fun c!108303 () Bool)

(assert (=> b!1078839 (= c!108303 (validKeyInArray!0 (select (arr!33309 lt!478511) #b00000000000000000000000000000000)))))

(declare-fun b!1078836 () Bool)

(assert (=> b!1078836 (= e!616818 call!45725)))

(declare-fun d!129787 () Bool)

(declare-fun res!718940 () Bool)

(assert (=> d!129787 (=> res!718940 e!616819)))

(assert (=> d!129787 (= res!718940 (bvsge #b00000000000000000000000000000000 (size!33847 lt!478511)))))

(assert (=> d!129787 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!478511 mask!1414) e!616819)))

(assert (= (and d!129787 (not res!718940)) b!1078839))

(assert (= (and b!1078839 c!108303) b!1078838))

(assert (= (and b!1078839 (not c!108303)) b!1078836))

(assert (= (and b!1078838 res!718941) b!1078837))

(assert (= (or b!1078837 b!1078836) bm!45722))

(assert (=> b!1078838 m!996703))

(declare-fun m!996715 () Bool)

(assert (=> b!1078838 m!996715))

(declare-fun m!996717 () Bool)

(assert (=> b!1078838 m!996717))

(assert (=> b!1078838 m!996703))

(declare-fun m!996719 () Bool)

(assert (=> b!1078838 m!996719))

(declare-fun m!996721 () Bool)

(assert (=> bm!45722 m!996721))

(assert (=> b!1078839 m!996703))

(assert (=> b!1078839 m!996703))

(assert (=> b!1078839 m!996705))

(assert (=> b!1078716 d!129787))

(declare-fun d!129789 () Bool)

(assert (=> d!129789 (= (validMask!0 mask!1414) (and (or (= mask!1414 #b00000000000000000000000000000111) (= mask!1414 #b00000000000000000000000000001111) (= mask!1414 #b00000000000000000000000000011111) (= mask!1414 #b00000000000000000000000000111111) (= mask!1414 #b00000000000000000000000001111111) (= mask!1414 #b00000000000000000000000011111111) (= mask!1414 #b00000000000000000000000111111111) (= mask!1414 #b00000000000000000000001111111111) (= mask!1414 #b00000000000000000000011111111111) (= mask!1414 #b00000000000000000000111111111111) (= mask!1414 #b00000000000000000001111111111111) (= mask!1414 #b00000000000000000011111111111111) (= mask!1414 #b00000000000000000111111111111111) (= mask!1414 #b00000000000000001111111111111111) (= mask!1414 #b00000000000000011111111111111111) (= mask!1414 #b00000000000000111111111111111111) (= mask!1414 #b00000000000001111111111111111111) (= mask!1414 #b00000000000011111111111111111111) (= mask!1414 #b00000000000111111111111111111111) (= mask!1414 #b00000000001111111111111111111111) (= mask!1414 #b00000000011111111111111111111111) (= mask!1414 #b00000000111111111111111111111111) (= mask!1414 #b00000001111111111111111111111111) (= mask!1414 #b00000011111111111111111111111111) (= mask!1414 #b00000111111111111111111111111111) (= mask!1414 #b00001111111111111111111111111111) (= mask!1414 #b00011111111111111111111111111111) (= mask!1414 #b00111111111111111111111111111111)) (bvsle mask!1414 #b00111111111111111111111111111111)))))

(assert (=> start!95514 d!129789))

(declare-fun d!129791 () Bool)

(assert (=> d!129791 (= (array_inv!25756 _keys!1070) (bvsge (size!33847 _keys!1070) #b00000000000000000000000000000000))))

(assert (=> start!95514 d!129791))

(declare-fun d!129793 () Bool)

(assert (=> d!129793 (= (array_inv!25757 _values!874) (bvsge (size!33846 _values!874) #b00000000000000000000000000000000))))

(assert (=> start!95514 d!129793))

(declare-fun b!1078847 () Bool)

(declare-fun e!616826 () Bool)

(assert (=> b!1078847 (= e!616826 tp_is_empty!26191)))

(declare-fun mapIsEmpty!41047 () Bool)

(declare-fun mapRes!41047 () Bool)

(assert (=> mapIsEmpty!41047 mapRes!41047))

(declare-fun condMapEmpty!41047 () Bool)

(declare-fun mapDefault!41047 () ValueCell!12386)

(assert (=> mapNonEmpty!41038 (= condMapEmpty!41047 (= mapRest!41038 ((as const (Array (_ BitVec 32) ValueCell!12386)) mapDefault!41047)))))

(assert (=> mapNonEmpty!41038 (= tp!78500 (and e!616826 mapRes!41047))))

(declare-fun mapNonEmpty!41047 () Bool)

(declare-fun tp!78509 () Bool)

(declare-fun e!616825 () Bool)

(assert (=> mapNonEmpty!41047 (= mapRes!41047 (and tp!78509 e!616825))))

(declare-fun mapKey!41047 () (_ BitVec 32))

(declare-fun mapValue!41047 () ValueCell!12386)

(declare-fun mapRest!41047 () (Array (_ BitVec 32) ValueCell!12386))

(assert (=> mapNonEmpty!41047 (= mapRest!41038 (store mapRest!41047 mapKey!41047 mapValue!41047))))

(declare-fun b!1078846 () Bool)

(assert (=> b!1078846 (= e!616825 tp_is_empty!26191)))

(assert (= (and mapNonEmpty!41038 condMapEmpty!41047) mapIsEmpty!41047))

(assert (= (and mapNonEmpty!41038 (not condMapEmpty!41047)) mapNonEmpty!41047))

(assert (= (and mapNonEmpty!41047 ((_ is ValueCellFull!12386) mapValue!41047)) b!1078846))

(assert (= (and mapNonEmpty!41038 ((_ is ValueCellFull!12386) mapDefault!41047)) b!1078847))

(declare-fun m!996723 () Bool)

(assert (=> mapNonEmpty!41047 m!996723))

(check-sat (not b!1078827) (not bm!45717) (not bm!45722) (not b!1078839) (not bm!45720) (not bm!45721) (not b!1078826) (not mapNonEmpty!41047) tp_is_empty!26191 (not b!1078803) (not b!1078814) (not b!1078838) (not b!1078829) (not b!1078834) (not b!1078831) (not d!129777) (not b!1078832) (not b!1078815))
(check-sat)

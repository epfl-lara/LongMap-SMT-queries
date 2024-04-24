; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107132 () Bool)

(assert start!107132)

(declare-fun b!1269382 () Bool)

(declare-fun res!844577 () Bool)

(declare-fun e!723355 () Bool)

(assert (=> b!1269382 (=> (not res!844577) (not e!723355))))

(declare-datatypes ((V!48707 0))(
  ( (V!48708 (val!16392 Int)) )
))
(declare-datatypes ((ValueCell!15464 0))(
  ( (ValueCellFull!15464 (v!19023 V!48707)) (EmptyCell!15464) )
))
(declare-datatypes ((array!82583 0))(
  ( (array!82584 (arr!39828 (Array (_ BitVec 32) ValueCell!15464)) (size!40365 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82583)

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-datatypes ((array!82585 0))(
  ( (array!82586 (arr!39829 (Array (_ BitVec 32) (_ BitVec 64))) (size!40366 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82585)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1269382 (= res!844577 (and (= (size!40365 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40366 _keys!1364) (size!40365 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1269383 () Bool)

(declare-fun e!723354 () Bool)

(declare-fun e!723353 () Bool)

(declare-fun mapRes!50521 () Bool)

(assert (=> b!1269383 (= e!723354 (and e!723353 mapRes!50521))))

(declare-fun condMapEmpty!50521 () Bool)

(declare-fun mapDefault!50521 () ValueCell!15464)

(assert (=> b!1269383 (= condMapEmpty!50521 (= (arr!39828 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15464)) mapDefault!50521)))))

(declare-fun b!1269384 () Bool)

(declare-fun tp_is_empty!32635 () Bool)

(assert (=> b!1269384 (= e!723353 tp_is_empty!32635)))

(declare-fun mapIsEmpty!50521 () Bool)

(assert (=> mapIsEmpty!50521 mapRes!50521))

(declare-fun b!1269385 () Bool)

(assert (=> b!1269385 (= e!723355 (bvsgt #b00000000000000000000000000000000 (size!40366 _keys!1364)))))

(declare-fun mapNonEmpty!50521 () Bool)

(declare-fun tp!96700 () Bool)

(declare-fun e!723352 () Bool)

(assert (=> mapNonEmpty!50521 (= mapRes!50521 (and tp!96700 e!723352))))

(declare-fun mapKey!50521 () (_ BitVec 32))

(declare-fun mapValue!50521 () ValueCell!15464)

(declare-fun mapRest!50521 () (Array (_ BitVec 32) ValueCell!15464))

(assert (=> mapNonEmpty!50521 (= (arr!39828 _values!1134) (store mapRest!50521 mapKey!50521 mapValue!50521))))

(declare-fun res!844578 () Bool)

(assert (=> start!107132 (=> (not res!844578) (not e!723355))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107132 (= res!844578 (validMask!0 mask!1730))))

(assert (=> start!107132 e!723355))

(declare-fun array_inv!30477 (array!82583) Bool)

(assert (=> start!107132 (and (array_inv!30477 _values!1134) e!723354)))

(assert (=> start!107132 true))

(declare-fun array_inv!30478 (array!82585) Bool)

(assert (=> start!107132 (array_inv!30478 _keys!1364)))

(declare-fun b!1269386 () Bool)

(declare-fun res!844579 () Bool)

(assert (=> b!1269386 (=> (not res!844579) (not e!723355))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82585 (_ BitVec 32)) Bool)

(assert (=> b!1269386 (= res!844579 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1269387 () Bool)

(assert (=> b!1269387 (= e!723352 tp_is_empty!32635)))

(assert (= (and start!107132 res!844578) b!1269382))

(assert (= (and b!1269382 res!844577) b!1269386))

(assert (= (and b!1269386 res!844579) b!1269385))

(assert (= (and b!1269383 condMapEmpty!50521) mapIsEmpty!50521))

(assert (= (and b!1269383 (not condMapEmpty!50521)) mapNonEmpty!50521))

(get-info :version)

(assert (= (and mapNonEmpty!50521 ((_ is ValueCellFull!15464) mapValue!50521)) b!1269387))

(assert (= (and b!1269383 ((_ is ValueCellFull!15464) mapDefault!50521)) b!1269384))

(assert (= start!107132 b!1269383))

(declare-fun m!1168669 () Bool)

(assert (=> mapNonEmpty!50521 m!1168669))

(declare-fun m!1168671 () Bool)

(assert (=> start!107132 m!1168671))

(declare-fun m!1168673 () Bool)

(assert (=> start!107132 m!1168673))

(declare-fun m!1168675 () Bool)

(assert (=> start!107132 m!1168675))

(declare-fun m!1168677 () Bool)

(assert (=> b!1269386 m!1168677))

(check-sat (not b!1269386) (not start!107132) (not mapNonEmpty!50521) tp_is_empty!32635)
(check-sat)
(get-model)

(declare-fun b!1269432 () Bool)

(declare-fun e!723395 () Bool)

(declare-fun e!723394 () Bool)

(assert (=> b!1269432 (= e!723395 e!723394)))

(declare-fun c!124023 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1269432 (= c!124023 (validKeyInArray!0 (select (arr!39829 _keys!1364) #b00000000000000000000000000000000)))))

(declare-fun b!1269433 () Bool)

(declare-fun e!723393 () Bool)

(declare-fun call!62571 () Bool)

(assert (=> b!1269433 (= e!723393 call!62571)))

(declare-fun b!1269434 () Bool)

(assert (=> b!1269434 (= e!723394 e!723393)))

(declare-fun lt!574874 () (_ BitVec 64))

(assert (=> b!1269434 (= lt!574874 (select (arr!39829 _keys!1364) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!42201 0))(
  ( (Unit!42202) )
))
(declare-fun lt!574875 () Unit!42201)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!82585 (_ BitVec 64) (_ BitVec 32)) Unit!42201)

(assert (=> b!1269434 (= lt!574875 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1364 lt!574874 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!82585 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1269434 (arrayContainsKey!0 _keys!1364 lt!574874 #b00000000000000000000000000000000)))

(declare-fun lt!574873 () Unit!42201)

(assert (=> b!1269434 (= lt!574873 lt!574875)))

(declare-fun res!844602 () Bool)

(declare-datatypes ((SeekEntryResult!9939 0))(
  ( (MissingZero!9939 (index!42127 (_ BitVec 32))) (Found!9939 (index!42128 (_ BitVec 32))) (Intermediate!9939 (undefined!10751 Bool) (index!42129 (_ BitVec 32)) (x!111812 (_ BitVec 32))) (Undefined!9939) (MissingVacant!9939 (index!42130 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!82585 (_ BitVec 32)) SeekEntryResult!9939)

(assert (=> b!1269434 (= res!844602 (= (seekEntryOrOpen!0 (select (arr!39829 _keys!1364) #b00000000000000000000000000000000) _keys!1364 mask!1730) (Found!9939 #b00000000000000000000000000000000)))))

(assert (=> b!1269434 (=> (not res!844602) (not e!723393))))

(declare-fun bm!62568 () Bool)

(assert (=> bm!62568 (= call!62571 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1364 mask!1730))))

(declare-fun b!1269435 () Bool)

(assert (=> b!1269435 (= e!723394 call!62571)))

(declare-fun d!140087 () Bool)

(declare-fun res!844603 () Bool)

(assert (=> d!140087 (=> res!844603 e!723395)))

(assert (=> d!140087 (= res!844603 (bvsge #b00000000000000000000000000000000 (size!40366 _keys!1364)))))

(assert (=> d!140087 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730) e!723395)))

(assert (= (and d!140087 (not res!844603)) b!1269432))

(assert (= (and b!1269432 c!124023) b!1269434))

(assert (= (and b!1269432 (not c!124023)) b!1269435))

(assert (= (and b!1269434 res!844602) b!1269433))

(assert (= (or b!1269433 b!1269435) bm!62568))

(declare-fun m!1168699 () Bool)

(assert (=> b!1269432 m!1168699))

(assert (=> b!1269432 m!1168699))

(declare-fun m!1168701 () Bool)

(assert (=> b!1269432 m!1168701))

(assert (=> b!1269434 m!1168699))

(declare-fun m!1168703 () Bool)

(assert (=> b!1269434 m!1168703))

(declare-fun m!1168705 () Bool)

(assert (=> b!1269434 m!1168705))

(assert (=> b!1269434 m!1168699))

(declare-fun m!1168707 () Bool)

(assert (=> b!1269434 m!1168707))

(declare-fun m!1168709 () Bool)

(assert (=> bm!62568 m!1168709))

(assert (=> b!1269386 d!140087))

(declare-fun d!140089 () Bool)

(assert (=> d!140089 (= (validMask!0 mask!1730) (and (or (= mask!1730 #b00000000000000000000000000000111) (= mask!1730 #b00000000000000000000000000001111) (= mask!1730 #b00000000000000000000000000011111) (= mask!1730 #b00000000000000000000000000111111) (= mask!1730 #b00000000000000000000000001111111) (= mask!1730 #b00000000000000000000000011111111) (= mask!1730 #b00000000000000000000000111111111) (= mask!1730 #b00000000000000000000001111111111) (= mask!1730 #b00000000000000000000011111111111) (= mask!1730 #b00000000000000000000111111111111) (= mask!1730 #b00000000000000000001111111111111) (= mask!1730 #b00000000000000000011111111111111) (= mask!1730 #b00000000000000000111111111111111) (= mask!1730 #b00000000000000001111111111111111) (= mask!1730 #b00000000000000011111111111111111) (= mask!1730 #b00000000000000111111111111111111) (= mask!1730 #b00000000000001111111111111111111) (= mask!1730 #b00000000000011111111111111111111) (= mask!1730 #b00000000000111111111111111111111) (= mask!1730 #b00000000001111111111111111111111) (= mask!1730 #b00000000011111111111111111111111) (= mask!1730 #b00000000111111111111111111111111) (= mask!1730 #b00000001111111111111111111111111) (= mask!1730 #b00000011111111111111111111111111) (= mask!1730 #b00000111111111111111111111111111) (= mask!1730 #b00001111111111111111111111111111) (= mask!1730 #b00011111111111111111111111111111) (= mask!1730 #b00111111111111111111111111111111)) (bvsle mask!1730 #b00111111111111111111111111111111)))))

(assert (=> start!107132 d!140089))

(declare-fun d!140091 () Bool)

(assert (=> d!140091 (= (array_inv!30477 _values!1134) (bvsge (size!40365 _values!1134) #b00000000000000000000000000000000))))

(assert (=> start!107132 d!140091))

(declare-fun d!140093 () Bool)

(assert (=> d!140093 (= (array_inv!30478 _keys!1364) (bvsge (size!40366 _keys!1364) #b00000000000000000000000000000000))))

(assert (=> start!107132 d!140093))

(declare-fun b!1269442 () Bool)

(declare-fun e!723401 () Bool)

(assert (=> b!1269442 (= e!723401 tp_is_empty!32635)))

(declare-fun condMapEmpty!50530 () Bool)

(declare-fun mapDefault!50530 () ValueCell!15464)

(assert (=> mapNonEmpty!50521 (= condMapEmpty!50530 (= mapRest!50521 ((as const (Array (_ BitVec 32) ValueCell!15464)) mapDefault!50530)))))

(declare-fun e!723400 () Bool)

(declare-fun mapRes!50530 () Bool)

(assert (=> mapNonEmpty!50521 (= tp!96700 (and e!723400 mapRes!50530))))

(declare-fun mapNonEmpty!50530 () Bool)

(declare-fun tp!96709 () Bool)

(assert (=> mapNonEmpty!50530 (= mapRes!50530 (and tp!96709 e!723401))))

(declare-fun mapRest!50530 () (Array (_ BitVec 32) ValueCell!15464))

(declare-fun mapValue!50530 () ValueCell!15464)

(declare-fun mapKey!50530 () (_ BitVec 32))

(assert (=> mapNonEmpty!50530 (= mapRest!50521 (store mapRest!50530 mapKey!50530 mapValue!50530))))

(declare-fun b!1269443 () Bool)

(assert (=> b!1269443 (= e!723400 tp_is_empty!32635)))

(declare-fun mapIsEmpty!50530 () Bool)

(assert (=> mapIsEmpty!50530 mapRes!50530))

(assert (= (and mapNonEmpty!50521 condMapEmpty!50530) mapIsEmpty!50530))

(assert (= (and mapNonEmpty!50521 (not condMapEmpty!50530)) mapNonEmpty!50530))

(assert (= (and mapNonEmpty!50530 ((_ is ValueCellFull!15464) mapValue!50530)) b!1269442))

(assert (= (and mapNonEmpty!50521 ((_ is ValueCellFull!15464) mapDefault!50530)) b!1269443))

(declare-fun m!1168711 () Bool)

(assert (=> mapNonEmpty!50530 m!1168711))

(check-sat tp_is_empty!32635 (not b!1269434) (not bm!62568) (not b!1269432) (not mapNonEmpty!50530))
(check-sat)

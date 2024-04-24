; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107160 () Bool)

(assert start!107160)

(declare-fun b!1269532 () Bool)

(declare-fun res!844645 () Bool)

(declare-fun e!723474 () Bool)

(assert (=> b!1269532 (=> (not res!844645) (not e!723474))))

(declare-datatypes ((array!82611 0))(
  ( (array!82612 (arr!39840 (Array (_ BitVec 32) (_ BitVec 64))) (size!40377 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82611)

(assert (=> b!1269532 (= res!844645 (and (bvsle #b00000000000000000000000000000000 (size!40377 _keys!1364)) (bvslt (size!40377 _keys!1364) #b01111111111111111111111111111111)))))

(declare-fun b!1269533 () Bool)

(declare-fun res!844647 () Bool)

(assert (=> b!1269533 (=> (not res!844647) (not e!723474))))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82611 (_ BitVec 32)) Bool)

(assert (=> b!1269533 (= res!844647 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun res!844646 () Bool)

(assert (=> start!107160 (=> (not res!844646) (not e!723474))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107160 (= res!844646 (validMask!0 mask!1730))))

(assert (=> start!107160 e!723474))

(declare-datatypes ((V!48723 0))(
  ( (V!48724 (val!16398 Int)) )
))
(declare-datatypes ((ValueCell!15470 0))(
  ( (ValueCellFull!15470 (v!19029 V!48723)) (EmptyCell!15470) )
))
(declare-datatypes ((array!82613 0))(
  ( (array!82614 (arr!39841 (Array (_ BitVec 32) ValueCell!15470)) (size!40378 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82613)

(declare-fun e!723475 () Bool)

(declare-fun array_inv!30487 (array!82613) Bool)

(assert (=> start!107160 (and (array_inv!30487 _values!1134) e!723475)))

(assert (=> start!107160 true))

(declare-fun array_inv!30488 (array!82611) Bool)

(assert (=> start!107160 (array_inv!30488 _keys!1364)))

(declare-fun b!1269534 () Bool)

(declare-fun e!723473 () Bool)

(declare-fun tp_is_empty!32647 () Bool)

(assert (=> b!1269534 (= e!723473 tp_is_empty!32647)))

(declare-fun mapIsEmpty!50545 () Bool)

(declare-fun mapRes!50545 () Bool)

(assert (=> mapIsEmpty!50545 mapRes!50545))

(declare-fun b!1269535 () Bool)

(declare-fun e!723472 () Bool)

(assert (=> b!1269535 (= e!723472 tp_is_empty!32647)))

(declare-fun b!1269536 () Bool)

(declare-fun res!844648 () Bool)

(assert (=> b!1269536 (=> (not res!844648) (not e!723474))))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(assert (=> b!1269536 (= res!844648 (and (= (size!40378 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40377 _keys!1364) (size!40378 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1269537 () Bool)

(assert (=> b!1269537 (= e!723475 (and e!723473 mapRes!50545))))

(declare-fun condMapEmpty!50545 () Bool)

(declare-fun mapDefault!50545 () ValueCell!15470)

(assert (=> b!1269537 (= condMapEmpty!50545 (= (arr!39841 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15470)) mapDefault!50545)))))

(declare-fun b!1269538 () Bool)

(declare-datatypes ((List!28414 0))(
  ( (Nil!28411) (Cons!28410 (h!29628 (_ BitVec 64)) (t!41935 List!28414)) )
))
(declare-fun noDuplicate!2060 (List!28414) Bool)

(assert (=> b!1269538 (= e!723474 (not (noDuplicate!2060 Nil!28411)))))

(declare-fun mapNonEmpty!50545 () Bool)

(declare-fun tp!96724 () Bool)

(assert (=> mapNonEmpty!50545 (= mapRes!50545 (and tp!96724 e!723472))))

(declare-fun mapValue!50545 () ValueCell!15470)

(declare-fun mapRest!50545 () (Array (_ BitVec 32) ValueCell!15470))

(declare-fun mapKey!50545 () (_ BitVec 32))

(assert (=> mapNonEmpty!50545 (= (arr!39841 _values!1134) (store mapRest!50545 mapKey!50545 mapValue!50545))))

(assert (= (and start!107160 res!844646) b!1269536))

(assert (= (and b!1269536 res!844648) b!1269533))

(assert (= (and b!1269533 res!844647) b!1269532))

(assert (= (and b!1269532 res!844645) b!1269538))

(assert (= (and b!1269537 condMapEmpty!50545) mapIsEmpty!50545))

(assert (= (and b!1269537 (not condMapEmpty!50545)) mapNonEmpty!50545))

(get-info :version)

(assert (= (and mapNonEmpty!50545 ((_ is ValueCellFull!15470) mapValue!50545)) b!1269535))

(assert (= (and b!1269537 ((_ is ValueCellFull!15470) mapDefault!50545)) b!1269534))

(assert (= start!107160 b!1269537))

(declare-fun m!1168757 () Bool)

(assert (=> b!1269533 m!1168757))

(declare-fun m!1168759 () Bool)

(assert (=> start!107160 m!1168759))

(declare-fun m!1168761 () Bool)

(assert (=> start!107160 m!1168761))

(declare-fun m!1168763 () Bool)

(assert (=> start!107160 m!1168763))

(declare-fun m!1168765 () Bool)

(assert (=> b!1269538 m!1168765))

(declare-fun m!1168767 () Bool)

(assert (=> mapNonEmpty!50545 m!1168767))

(check-sat tp_is_empty!32647 (not b!1269533) (not b!1269538) (not start!107160) (not mapNonEmpty!50545))
(check-sat)
(get-model)

(declare-fun d!140107 () Bool)

(declare-fun res!844677 () Bool)

(declare-fun e!723511 () Bool)

(assert (=> d!140107 (=> res!844677 e!723511)))

(assert (=> d!140107 (= res!844677 ((_ is Nil!28411) Nil!28411))))

(assert (=> d!140107 (= (noDuplicate!2060 Nil!28411) e!723511)))

(declare-fun b!1269585 () Bool)

(declare-fun e!723512 () Bool)

(assert (=> b!1269585 (= e!723511 e!723512)))

(declare-fun res!844678 () Bool)

(assert (=> b!1269585 (=> (not res!844678) (not e!723512))))

(declare-fun contains!7686 (List!28414 (_ BitVec 64)) Bool)

(assert (=> b!1269585 (= res!844678 (not (contains!7686 (t!41935 Nil!28411) (h!29628 Nil!28411))))))

(declare-fun b!1269586 () Bool)

(assert (=> b!1269586 (= e!723512 (noDuplicate!2060 (t!41935 Nil!28411)))))

(assert (= (and d!140107 (not res!844677)) b!1269585))

(assert (= (and b!1269585 res!844678) b!1269586))

(declare-fun m!1168793 () Bool)

(assert (=> b!1269585 m!1168793))

(declare-fun m!1168795 () Bool)

(assert (=> b!1269586 m!1168795))

(assert (=> b!1269538 d!140107))

(declare-fun d!140109 () Bool)

(assert (=> d!140109 (= (validMask!0 mask!1730) (and (or (= mask!1730 #b00000000000000000000000000000111) (= mask!1730 #b00000000000000000000000000001111) (= mask!1730 #b00000000000000000000000000011111) (= mask!1730 #b00000000000000000000000000111111) (= mask!1730 #b00000000000000000000000001111111) (= mask!1730 #b00000000000000000000000011111111) (= mask!1730 #b00000000000000000000000111111111) (= mask!1730 #b00000000000000000000001111111111) (= mask!1730 #b00000000000000000000011111111111) (= mask!1730 #b00000000000000000000111111111111) (= mask!1730 #b00000000000000000001111111111111) (= mask!1730 #b00000000000000000011111111111111) (= mask!1730 #b00000000000000000111111111111111) (= mask!1730 #b00000000000000001111111111111111) (= mask!1730 #b00000000000000011111111111111111) (= mask!1730 #b00000000000000111111111111111111) (= mask!1730 #b00000000000001111111111111111111) (= mask!1730 #b00000000000011111111111111111111) (= mask!1730 #b00000000000111111111111111111111) (= mask!1730 #b00000000001111111111111111111111) (= mask!1730 #b00000000011111111111111111111111) (= mask!1730 #b00000000111111111111111111111111) (= mask!1730 #b00000001111111111111111111111111) (= mask!1730 #b00000011111111111111111111111111) (= mask!1730 #b00000111111111111111111111111111) (= mask!1730 #b00001111111111111111111111111111) (= mask!1730 #b00011111111111111111111111111111) (= mask!1730 #b00111111111111111111111111111111)) (bvsle mask!1730 #b00111111111111111111111111111111)))))

(assert (=> start!107160 d!140109))

(declare-fun d!140111 () Bool)

(assert (=> d!140111 (= (array_inv!30487 _values!1134) (bvsge (size!40378 _values!1134) #b00000000000000000000000000000000))))

(assert (=> start!107160 d!140111))

(declare-fun d!140113 () Bool)

(assert (=> d!140113 (= (array_inv!30488 _keys!1364) (bvsge (size!40377 _keys!1364) #b00000000000000000000000000000000))))

(assert (=> start!107160 d!140113))

(declare-fun b!1269595 () Bool)

(declare-fun e!723521 () Bool)

(declare-fun e!723520 () Bool)

(assert (=> b!1269595 (= e!723521 e!723520)))

(declare-fun lt!574892 () (_ BitVec 64))

(assert (=> b!1269595 (= lt!574892 (select (arr!39840 _keys!1364) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!42205 0))(
  ( (Unit!42206) )
))
(declare-fun lt!574893 () Unit!42205)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!82611 (_ BitVec 64) (_ BitVec 32)) Unit!42205)

(assert (=> b!1269595 (= lt!574893 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1364 lt!574892 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!82611 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1269595 (arrayContainsKey!0 _keys!1364 lt!574892 #b00000000000000000000000000000000)))

(declare-fun lt!574891 () Unit!42205)

(assert (=> b!1269595 (= lt!574891 lt!574893)))

(declare-fun res!844683 () Bool)

(declare-datatypes ((SeekEntryResult!9941 0))(
  ( (MissingZero!9941 (index!42135 (_ BitVec 32))) (Found!9941 (index!42136 (_ BitVec 32))) (Intermediate!9941 (undefined!10753 Bool) (index!42137 (_ BitVec 32)) (x!111834 (_ BitVec 32))) (Undefined!9941) (MissingVacant!9941 (index!42138 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!82611 (_ BitVec 32)) SeekEntryResult!9941)

(assert (=> b!1269595 (= res!844683 (= (seekEntryOrOpen!0 (select (arr!39840 _keys!1364) #b00000000000000000000000000000000) _keys!1364 mask!1730) (Found!9941 #b00000000000000000000000000000000)))))

(assert (=> b!1269595 (=> (not res!844683) (not e!723520))))

(declare-fun b!1269596 () Bool)

(declare-fun call!62577 () Bool)

(assert (=> b!1269596 (= e!723520 call!62577)))

(declare-fun bm!62574 () Bool)

(assert (=> bm!62574 (= call!62577 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1364 mask!1730))))

(declare-fun b!1269597 () Bool)

(assert (=> b!1269597 (= e!723521 call!62577)))

(declare-fun d!140115 () Bool)

(declare-fun res!844684 () Bool)

(declare-fun e!723519 () Bool)

(assert (=> d!140115 (=> res!844684 e!723519)))

(assert (=> d!140115 (= res!844684 (bvsge #b00000000000000000000000000000000 (size!40377 _keys!1364)))))

(assert (=> d!140115 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730) e!723519)))

(declare-fun b!1269598 () Bool)

(assert (=> b!1269598 (= e!723519 e!723521)))

(declare-fun c!124029 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1269598 (= c!124029 (validKeyInArray!0 (select (arr!39840 _keys!1364) #b00000000000000000000000000000000)))))

(assert (= (and d!140115 (not res!844684)) b!1269598))

(assert (= (and b!1269598 c!124029) b!1269595))

(assert (= (and b!1269598 (not c!124029)) b!1269597))

(assert (= (and b!1269595 res!844683) b!1269596))

(assert (= (or b!1269596 b!1269597) bm!62574))

(declare-fun m!1168797 () Bool)

(assert (=> b!1269595 m!1168797))

(declare-fun m!1168799 () Bool)

(assert (=> b!1269595 m!1168799))

(declare-fun m!1168801 () Bool)

(assert (=> b!1269595 m!1168801))

(assert (=> b!1269595 m!1168797))

(declare-fun m!1168803 () Bool)

(assert (=> b!1269595 m!1168803))

(declare-fun m!1168805 () Bool)

(assert (=> bm!62574 m!1168805))

(assert (=> b!1269598 m!1168797))

(assert (=> b!1269598 m!1168797))

(declare-fun m!1168807 () Bool)

(assert (=> b!1269598 m!1168807))

(assert (=> b!1269533 d!140115))

(declare-fun condMapEmpty!50554 () Bool)

(declare-fun mapDefault!50554 () ValueCell!15470)

(assert (=> mapNonEmpty!50545 (= condMapEmpty!50554 (= mapRest!50545 ((as const (Array (_ BitVec 32) ValueCell!15470)) mapDefault!50554)))))

(declare-fun e!723526 () Bool)

(declare-fun mapRes!50554 () Bool)

(assert (=> mapNonEmpty!50545 (= tp!96724 (and e!723526 mapRes!50554))))

(declare-fun mapIsEmpty!50554 () Bool)

(assert (=> mapIsEmpty!50554 mapRes!50554))

(declare-fun b!1269606 () Bool)

(assert (=> b!1269606 (= e!723526 tp_is_empty!32647)))

(declare-fun mapNonEmpty!50554 () Bool)

(declare-fun tp!96733 () Bool)

(declare-fun e!723527 () Bool)

(assert (=> mapNonEmpty!50554 (= mapRes!50554 (and tp!96733 e!723527))))

(declare-fun mapKey!50554 () (_ BitVec 32))

(declare-fun mapRest!50554 () (Array (_ BitVec 32) ValueCell!15470))

(declare-fun mapValue!50554 () ValueCell!15470)

(assert (=> mapNonEmpty!50554 (= mapRest!50545 (store mapRest!50554 mapKey!50554 mapValue!50554))))

(declare-fun b!1269605 () Bool)

(assert (=> b!1269605 (= e!723527 tp_is_empty!32647)))

(assert (= (and mapNonEmpty!50545 condMapEmpty!50554) mapIsEmpty!50554))

(assert (= (and mapNonEmpty!50545 (not condMapEmpty!50554)) mapNonEmpty!50554))

(assert (= (and mapNonEmpty!50554 ((_ is ValueCellFull!15470) mapValue!50554)) b!1269605))

(assert (= (and mapNonEmpty!50545 ((_ is ValueCellFull!15470) mapDefault!50554)) b!1269606))

(declare-fun m!1168809 () Bool)

(assert (=> mapNonEmpty!50554 m!1168809))

(check-sat (not b!1269595) (not mapNonEmpty!50554) (not b!1269586) (not b!1269585) (not bm!62574) tp_is_empty!32647 (not b!1269598))
(check-sat)

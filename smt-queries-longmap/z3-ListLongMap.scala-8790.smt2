; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107176 () Bool)

(assert start!107176)

(declare-fun b!1269625 () Bool)

(declare-fun e!723541 () Bool)

(declare-fun tp_is_empty!32653 () Bool)

(assert (=> b!1269625 (= e!723541 tp_is_empty!32653)))

(declare-fun b!1269626 () Bool)

(declare-fun e!723540 () Bool)

(declare-datatypes ((List!28415 0))(
  ( (Nil!28412) (Cons!28411 (h!29629 (_ BitVec 64)) (t!41936 List!28415)) )
))
(declare-fun contains!7687 (List!28415 (_ BitVec 64)) Bool)

(assert (=> b!1269626 (= e!723540 (contains!7687 Nil!28412 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!50557 () Bool)

(declare-fun mapRes!50557 () Bool)

(declare-fun tp!96736 () Bool)

(assert (=> mapNonEmpty!50557 (= mapRes!50557 (and tp!96736 e!723541))))

(declare-datatypes ((V!48731 0))(
  ( (V!48732 (val!16401 Int)) )
))
(declare-datatypes ((ValueCell!15473 0))(
  ( (ValueCellFull!15473 (v!19032 V!48731)) (EmptyCell!15473) )
))
(declare-datatypes ((array!82625 0))(
  ( (array!82626 (arr!39846 (Array (_ BitVec 32) ValueCell!15473)) (size!40383 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82625)

(declare-fun mapKey!50557 () (_ BitVec 32))

(declare-fun mapValue!50557 () ValueCell!15473)

(declare-fun mapRest!50557 () (Array (_ BitVec 32) ValueCell!15473))

(assert (=> mapNonEmpty!50557 (= (arr!39846 _values!1134) (store mapRest!50557 mapKey!50557 mapValue!50557))))

(declare-fun b!1269628 () Bool)

(declare-fun e!723544 () Bool)

(assert (=> b!1269628 (= e!723544 e!723540)))

(declare-fun res!844702 () Bool)

(assert (=> b!1269628 (=> res!844702 e!723540)))

(assert (=> b!1269628 (= res!844702 (contains!7687 Nil!28412 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1269629 () Bool)

(declare-fun e!723543 () Bool)

(assert (=> b!1269629 (= e!723543 tp_is_empty!32653)))

(declare-fun mapIsEmpty!50557 () Bool)

(assert (=> mapIsEmpty!50557 mapRes!50557))

(declare-fun b!1269630 () Bool)

(declare-fun res!844698 () Bool)

(assert (=> b!1269630 (=> (not res!844698) (not e!723544))))

(declare-fun noDuplicate!2061 (List!28415) Bool)

(assert (=> b!1269630 (= res!844698 (noDuplicate!2061 Nil!28412))))

(declare-fun b!1269631 () Bool)

(declare-fun res!844701 () Bool)

(assert (=> b!1269631 (=> (not res!844701) (not e!723544))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-datatypes ((array!82627 0))(
  ( (array!82628 (arr!39847 (Array (_ BitVec 32) (_ BitVec 64))) (size!40384 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82627)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1269631 (= res!844701 (and (= (size!40383 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40384 _keys!1364) (size!40383 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1269632 () Bool)

(declare-fun res!844700 () Bool)

(assert (=> b!1269632 (=> (not res!844700) (not e!723544))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82627 (_ BitVec 32)) Bool)

(assert (=> b!1269632 (= res!844700 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1269633 () Bool)

(declare-fun res!844699 () Bool)

(assert (=> b!1269633 (=> (not res!844699) (not e!723544))))

(assert (=> b!1269633 (= res!844699 (and (bvsle #b00000000000000000000000000000000 (size!40384 _keys!1364)) (bvslt (size!40384 _keys!1364) #b01111111111111111111111111111111)))))

(declare-fun res!844697 () Bool)

(assert (=> start!107176 (=> (not res!844697) (not e!723544))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107176 (= res!844697 (validMask!0 mask!1730))))

(assert (=> start!107176 e!723544))

(declare-fun e!723542 () Bool)

(declare-fun array_inv!30491 (array!82625) Bool)

(assert (=> start!107176 (and (array_inv!30491 _values!1134) e!723542)))

(assert (=> start!107176 true))

(declare-fun array_inv!30492 (array!82627) Bool)

(assert (=> start!107176 (array_inv!30492 _keys!1364)))

(declare-fun b!1269627 () Bool)

(assert (=> b!1269627 (= e!723542 (and e!723543 mapRes!50557))))

(declare-fun condMapEmpty!50557 () Bool)

(declare-fun mapDefault!50557 () ValueCell!15473)

(assert (=> b!1269627 (= condMapEmpty!50557 (= (arr!39846 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15473)) mapDefault!50557)))))

(assert (= (and start!107176 res!844697) b!1269631))

(assert (= (and b!1269631 res!844701) b!1269632))

(assert (= (and b!1269632 res!844700) b!1269633))

(assert (= (and b!1269633 res!844699) b!1269630))

(assert (= (and b!1269630 res!844698) b!1269628))

(assert (= (and b!1269628 (not res!844702)) b!1269626))

(assert (= (and b!1269627 condMapEmpty!50557) mapIsEmpty!50557))

(assert (= (and b!1269627 (not condMapEmpty!50557)) mapNonEmpty!50557))

(get-info :version)

(assert (= (and mapNonEmpty!50557 ((_ is ValueCellFull!15473) mapValue!50557)) b!1269625))

(assert (= (and b!1269627 ((_ is ValueCellFull!15473) mapDefault!50557)) b!1269629))

(assert (= start!107176 b!1269627))

(declare-fun m!1168811 () Bool)

(assert (=> mapNonEmpty!50557 m!1168811))

(declare-fun m!1168813 () Bool)

(assert (=> b!1269626 m!1168813))

(declare-fun m!1168815 () Bool)

(assert (=> start!107176 m!1168815))

(declare-fun m!1168817 () Bool)

(assert (=> start!107176 m!1168817))

(declare-fun m!1168819 () Bool)

(assert (=> start!107176 m!1168819))

(declare-fun m!1168821 () Bool)

(assert (=> b!1269628 m!1168821))

(declare-fun m!1168823 () Bool)

(assert (=> b!1269632 m!1168823))

(declare-fun m!1168825 () Bool)

(assert (=> b!1269630 m!1168825))

(check-sat (not start!107176) (not b!1269630) tp_is_empty!32653 (not mapNonEmpty!50557) (not b!1269632) (not b!1269628) (not b!1269626))
(check-sat)
(get-model)

(declare-fun d!140119 () Bool)

(declare-fun lt!574896 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!638 (List!28415) (InoxSet (_ BitVec 64)))

(assert (=> d!140119 (= lt!574896 (select (content!638 Nil!28412) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!723586 () Bool)

(assert (=> d!140119 (= lt!574896 e!723586)))

(declare-fun res!844743 () Bool)

(assert (=> d!140119 (=> (not res!844743) (not e!723586))))

(assert (=> d!140119 (= res!844743 ((_ is Cons!28411) Nil!28412))))

(assert (=> d!140119 (= (contains!7687 Nil!28412 #b0000000000000000000000000000000000000000000000000000000000000000) lt!574896)))

(declare-fun b!1269692 () Bool)

(declare-fun e!723587 () Bool)

(assert (=> b!1269692 (= e!723586 e!723587)))

(declare-fun res!844744 () Bool)

(assert (=> b!1269692 (=> res!844744 e!723587)))

(assert (=> b!1269692 (= res!844744 (= (h!29629 Nil!28412) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1269693 () Bool)

(assert (=> b!1269693 (= e!723587 (contains!7687 (t!41936 Nil!28412) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!140119 res!844743) b!1269692))

(assert (= (and b!1269692 (not res!844744)) b!1269693))

(declare-fun m!1168859 () Bool)

(assert (=> d!140119 m!1168859))

(declare-fun m!1168861 () Bool)

(assert (=> d!140119 m!1168861))

(declare-fun m!1168863 () Bool)

(assert (=> b!1269693 m!1168863))

(assert (=> b!1269628 d!140119))

(declare-fun b!1269702 () Bool)

(declare-fun e!723594 () Bool)

(declare-fun e!723595 () Bool)

(assert (=> b!1269702 (= e!723594 e!723595)))

(declare-fun c!124032 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1269702 (= c!124032 (validKeyInArray!0 (select (arr!39847 _keys!1364) #b00000000000000000000000000000000)))))

(declare-fun b!1269703 () Bool)

(declare-fun call!62580 () Bool)

(assert (=> b!1269703 (= e!723595 call!62580)))

(declare-fun b!1269704 () Bool)

(declare-fun e!723596 () Bool)

(assert (=> b!1269704 (= e!723596 call!62580)))

(declare-fun bm!62577 () Bool)

(assert (=> bm!62577 (= call!62580 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1364 mask!1730))))

(declare-fun b!1269705 () Bool)

(assert (=> b!1269705 (= e!723595 e!723596)))

(declare-fun lt!574903 () (_ BitVec 64))

(assert (=> b!1269705 (= lt!574903 (select (arr!39847 _keys!1364) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!42207 0))(
  ( (Unit!42208) )
))
(declare-fun lt!574904 () Unit!42207)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!82627 (_ BitVec 64) (_ BitVec 32)) Unit!42207)

(assert (=> b!1269705 (= lt!574904 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1364 lt!574903 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!82627 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1269705 (arrayContainsKey!0 _keys!1364 lt!574903 #b00000000000000000000000000000000)))

(declare-fun lt!574905 () Unit!42207)

(assert (=> b!1269705 (= lt!574905 lt!574904)))

(declare-fun res!844750 () Bool)

(declare-datatypes ((SeekEntryResult!9942 0))(
  ( (MissingZero!9942 (index!42139 (_ BitVec 32))) (Found!9942 (index!42140 (_ BitVec 32))) (Intermediate!9942 (undefined!10754 Bool) (index!42141 (_ BitVec 32)) (x!111845 (_ BitVec 32))) (Undefined!9942) (MissingVacant!9942 (index!42142 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!82627 (_ BitVec 32)) SeekEntryResult!9942)

(assert (=> b!1269705 (= res!844750 (= (seekEntryOrOpen!0 (select (arr!39847 _keys!1364) #b00000000000000000000000000000000) _keys!1364 mask!1730) (Found!9942 #b00000000000000000000000000000000)))))

(assert (=> b!1269705 (=> (not res!844750) (not e!723596))))

(declare-fun d!140121 () Bool)

(declare-fun res!844749 () Bool)

(assert (=> d!140121 (=> res!844749 e!723594)))

(assert (=> d!140121 (= res!844749 (bvsge #b00000000000000000000000000000000 (size!40384 _keys!1364)))))

(assert (=> d!140121 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730) e!723594)))

(assert (= (and d!140121 (not res!844749)) b!1269702))

(assert (= (and b!1269702 c!124032) b!1269705))

(assert (= (and b!1269702 (not c!124032)) b!1269703))

(assert (= (and b!1269705 res!844750) b!1269704))

(assert (= (or b!1269704 b!1269703) bm!62577))

(declare-fun m!1168865 () Bool)

(assert (=> b!1269702 m!1168865))

(assert (=> b!1269702 m!1168865))

(declare-fun m!1168867 () Bool)

(assert (=> b!1269702 m!1168867))

(declare-fun m!1168869 () Bool)

(assert (=> bm!62577 m!1168869))

(assert (=> b!1269705 m!1168865))

(declare-fun m!1168871 () Bool)

(assert (=> b!1269705 m!1168871))

(declare-fun m!1168873 () Bool)

(assert (=> b!1269705 m!1168873))

(assert (=> b!1269705 m!1168865))

(declare-fun m!1168875 () Bool)

(assert (=> b!1269705 m!1168875))

(assert (=> b!1269632 d!140121))

(declare-fun d!140123 () Bool)

(assert (=> d!140123 (= (validMask!0 mask!1730) (and (or (= mask!1730 #b00000000000000000000000000000111) (= mask!1730 #b00000000000000000000000000001111) (= mask!1730 #b00000000000000000000000000011111) (= mask!1730 #b00000000000000000000000000111111) (= mask!1730 #b00000000000000000000000001111111) (= mask!1730 #b00000000000000000000000011111111) (= mask!1730 #b00000000000000000000000111111111) (= mask!1730 #b00000000000000000000001111111111) (= mask!1730 #b00000000000000000000011111111111) (= mask!1730 #b00000000000000000000111111111111) (= mask!1730 #b00000000000000000001111111111111) (= mask!1730 #b00000000000000000011111111111111) (= mask!1730 #b00000000000000000111111111111111) (= mask!1730 #b00000000000000001111111111111111) (= mask!1730 #b00000000000000011111111111111111) (= mask!1730 #b00000000000000111111111111111111) (= mask!1730 #b00000000000001111111111111111111) (= mask!1730 #b00000000000011111111111111111111) (= mask!1730 #b00000000000111111111111111111111) (= mask!1730 #b00000000001111111111111111111111) (= mask!1730 #b00000000011111111111111111111111) (= mask!1730 #b00000000111111111111111111111111) (= mask!1730 #b00000001111111111111111111111111) (= mask!1730 #b00000011111111111111111111111111) (= mask!1730 #b00000111111111111111111111111111) (= mask!1730 #b00001111111111111111111111111111) (= mask!1730 #b00011111111111111111111111111111) (= mask!1730 #b00111111111111111111111111111111)) (bvsle mask!1730 #b00111111111111111111111111111111)))))

(assert (=> start!107176 d!140123))

(declare-fun d!140125 () Bool)

(assert (=> d!140125 (= (array_inv!30491 _values!1134) (bvsge (size!40383 _values!1134) #b00000000000000000000000000000000))))

(assert (=> start!107176 d!140125))

(declare-fun d!140127 () Bool)

(assert (=> d!140127 (= (array_inv!30492 _keys!1364) (bvsge (size!40384 _keys!1364) #b00000000000000000000000000000000))))

(assert (=> start!107176 d!140127))

(declare-fun d!140129 () Bool)

(declare-fun lt!574906 () Bool)

(assert (=> d!140129 (= lt!574906 (select (content!638 Nil!28412) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!723597 () Bool)

(assert (=> d!140129 (= lt!574906 e!723597)))

(declare-fun res!844751 () Bool)

(assert (=> d!140129 (=> (not res!844751) (not e!723597))))

(assert (=> d!140129 (= res!844751 ((_ is Cons!28411) Nil!28412))))

(assert (=> d!140129 (= (contains!7687 Nil!28412 #b1000000000000000000000000000000000000000000000000000000000000000) lt!574906)))

(declare-fun b!1269706 () Bool)

(declare-fun e!723598 () Bool)

(assert (=> b!1269706 (= e!723597 e!723598)))

(declare-fun res!844752 () Bool)

(assert (=> b!1269706 (=> res!844752 e!723598)))

(assert (=> b!1269706 (= res!844752 (= (h!29629 Nil!28412) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1269707 () Bool)

(assert (=> b!1269707 (= e!723598 (contains!7687 (t!41936 Nil!28412) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!140129 res!844751) b!1269706))

(assert (= (and b!1269706 (not res!844752)) b!1269707))

(assert (=> d!140129 m!1168859))

(declare-fun m!1168877 () Bool)

(assert (=> d!140129 m!1168877))

(declare-fun m!1168879 () Bool)

(assert (=> b!1269707 m!1168879))

(assert (=> b!1269626 d!140129))

(declare-fun d!140131 () Bool)

(declare-fun res!844757 () Bool)

(declare-fun e!723603 () Bool)

(assert (=> d!140131 (=> res!844757 e!723603)))

(assert (=> d!140131 (= res!844757 ((_ is Nil!28412) Nil!28412))))

(assert (=> d!140131 (= (noDuplicate!2061 Nil!28412) e!723603)))

(declare-fun b!1269712 () Bool)

(declare-fun e!723604 () Bool)

(assert (=> b!1269712 (= e!723603 e!723604)))

(declare-fun res!844758 () Bool)

(assert (=> b!1269712 (=> (not res!844758) (not e!723604))))

(assert (=> b!1269712 (= res!844758 (not (contains!7687 (t!41936 Nil!28412) (h!29629 Nil!28412))))))

(declare-fun b!1269713 () Bool)

(assert (=> b!1269713 (= e!723604 (noDuplicate!2061 (t!41936 Nil!28412)))))

(assert (= (and d!140131 (not res!844757)) b!1269712))

(assert (= (and b!1269712 res!844758) b!1269713))

(declare-fun m!1168881 () Bool)

(assert (=> b!1269712 m!1168881))

(declare-fun m!1168883 () Bool)

(assert (=> b!1269713 m!1168883))

(assert (=> b!1269630 d!140131))

(declare-fun condMapEmpty!50566 () Bool)

(declare-fun mapDefault!50566 () ValueCell!15473)

(assert (=> mapNonEmpty!50557 (= condMapEmpty!50566 (= mapRest!50557 ((as const (Array (_ BitVec 32) ValueCell!15473)) mapDefault!50566)))))

(declare-fun e!723610 () Bool)

(declare-fun mapRes!50566 () Bool)

(assert (=> mapNonEmpty!50557 (= tp!96736 (and e!723610 mapRes!50566))))

(declare-fun mapIsEmpty!50566 () Bool)

(assert (=> mapIsEmpty!50566 mapRes!50566))

(declare-fun mapNonEmpty!50566 () Bool)

(declare-fun tp!96745 () Bool)

(declare-fun e!723609 () Bool)

(assert (=> mapNonEmpty!50566 (= mapRes!50566 (and tp!96745 e!723609))))

(declare-fun mapValue!50566 () ValueCell!15473)

(declare-fun mapKey!50566 () (_ BitVec 32))

(declare-fun mapRest!50566 () (Array (_ BitVec 32) ValueCell!15473))

(assert (=> mapNonEmpty!50566 (= mapRest!50557 (store mapRest!50566 mapKey!50566 mapValue!50566))))

(declare-fun b!1269720 () Bool)

(assert (=> b!1269720 (= e!723609 tp_is_empty!32653)))

(declare-fun b!1269721 () Bool)

(assert (=> b!1269721 (= e!723610 tp_is_empty!32653)))

(assert (= (and mapNonEmpty!50557 condMapEmpty!50566) mapIsEmpty!50566))

(assert (= (and mapNonEmpty!50557 (not condMapEmpty!50566)) mapNonEmpty!50566))

(assert (= (and mapNonEmpty!50566 ((_ is ValueCellFull!15473) mapValue!50566)) b!1269720))

(assert (= (and mapNonEmpty!50557 ((_ is ValueCellFull!15473) mapDefault!50566)) b!1269721))

(declare-fun m!1168885 () Bool)

(assert (=> mapNonEmpty!50566 m!1168885))

(check-sat (not mapNonEmpty!50566) (not d!140129) (not b!1269713) (not d!140119) (not b!1269705) tp_is_empty!32653 (not b!1269702) (not b!1269707) (not b!1269693) (not b!1269712) (not bm!62577))
(check-sat)

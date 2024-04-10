; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107224 () Bool)

(assert start!107224)

(declare-fun res!845713 () Bool)

(declare-fun e!724679 () Bool)

(assert (=> start!107224 (=> (not res!845713) (not e!724679))))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107224 (= res!845713 (validMask!0 mask!1730))))

(assert (=> start!107224 e!724679))

(declare-datatypes ((V!49077 0))(
  ( (V!49078 (val!16531 Int)) )
))
(declare-datatypes ((ValueCell!15603 0))(
  ( (ValueCellFull!15603 (v!19168 V!49077)) (EmptyCell!15603) )
))
(declare-datatypes ((array!83082 0))(
  ( (array!83083 (arr!40078 (Array (_ BitVec 32) ValueCell!15603)) (size!40614 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!83082)

(declare-fun e!724681 () Bool)

(declare-fun array_inv!30483 (array!83082) Bool)

(assert (=> start!107224 (and (array_inv!30483 _values!1134) e!724681)))

(assert (=> start!107224 true))

(declare-datatypes ((array!83084 0))(
  ( (array!83085 (arr!40079 (Array (_ BitVec 32) (_ BitVec 64))) (size!40615 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!83084)

(declare-fun array_inv!30484 (array!83084) Bool)

(assert (=> start!107224 (array_inv!30484 _keys!1364)))

(declare-fun b!1271039 () Bool)

(declare-fun e!724683 () Bool)

(declare-fun mapRes!50950 () Bool)

(assert (=> b!1271039 (= e!724681 (and e!724683 mapRes!50950))))

(declare-fun condMapEmpty!50950 () Bool)

(declare-fun mapDefault!50950 () ValueCell!15603)

(assert (=> b!1271039 (= condMapEmpty!50950 (= (arr!40078 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15603)) mapDefault!50950)))))

(declare-fun b!1271040 () Bool)

(declare-fun e!724682 () Bool)

(declare-fun tp_is_empty!32913 () Bool)

(assert (=> b!1271040 (= e!724682 tp_is_empty!32913)))

(declare-fun mapIsEmpty!50950 () Bool)

(assert (=> mapIsEmpty!50950 mapRes!50950))

(declare-fun mapNonEmpty!50950 () Bool)

(declare-fun tp!97291 () Bool)

(assert (=> mapNonEmpty!50950 (= mapRes!50950 (and tp!97291 e!724682))))

(declare-fun mapRest!50950 () (Array (_ BitVec 32) ValueCell!15603))

(declare-fun mapValue!50950 () ValueCell!15603)

(declare-fun mapKey!50950 () (_ BitVec 32))

(assert (=> mapNonEmpty!50950 (= (arr!40078 _values!1134) (store mapRest!50950 mapKey!50950 mapValue!50950))))

(declare-fun b!1271041 () Bool)

(assert (=> b!1271041 (= e!724683 tp_is_empty!32913)))

(declare-fun b!1271042 () Bool)

(declare-fun res!845712 () Bool)

(assert (=> b!1271042 (=> (not res!845712) (not e!724679))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83084 (_ BitVec 32)) Bool)

(assert (=> b!1271042 (= res!845712 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1271043 () Bool)

(assert (=> b!1271043 (= e!724679 false)))

(declare-fun lt!574806 () Bool)

(declare-datatypes ((List!28511 0))(
  ( (Nil!28508) (Cons!28507 (h!29716 (_ BitVec 64)) (t!42040 List!28511)) )
))
(declare-fun arrayNoDuplicates!0 (array!83084 (_ BitVec 32) List!28511) Bool)

(assert (=> b!1271043 (= lt!574806 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28508))))

(declare-fun b!1271044 () Bool)

(declare-fun res!845714 () Bool)

(assert (=> b!1271044 (=> (not res!845714) (not e!724679))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1271044 (= res!845714 (and (= (size!40614 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40615 _keys!1364) (size!40614 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(assert (= (and start!107224 res!845713) b!1271044))

(assert (= (and b!1271044 res!845714) b!1271042))

(assert (= (and b!1271042 res!845712) b!1271043))

(assert (= (and b!1271039 condMapEmpty!50950) mapIsEmpty!50950))

(assert (= (and b!1271039 (not condMapEmpty!50950)) mapNonEmpty!50950))

(get-info :version)

(assert (= (and mapNonEmpty!50950 ((_ is ValueCellFull!15603) mapValue!50950)) b!1271040))

(assert (= (and b!1271039 ((_ is ValueCellFull!15603) mapDefault!50950)) b!1271041))

(assert (= start!107224 b!1271039))

(declare-fun m!1169123 () Bool)

(assert (=> start!107224 m!1169123))

(declare-fun m!1169125 () Bool)

(assert (=> start!107224 m!1169125))

(declare-fun m!1169127 () Bool)

(assert (=> start!107224 m!1169127))

(declare-fun m!1169129 () Bool)

(assert (=> mapNonEmpty!50950 m!1169129))

(declare-fun m!1169131 () Bool)

(assert (=> b!1271042 m!1169131))

(declare-fun m!1169133 () Bool)

(assert (=> b!1271043 m!1169133))

(check-sat (not mapNonEmpty!50950) (not b!1271043) (not start!107224) tp_is_empty!32913 (not b!1271042))
(check-sat)

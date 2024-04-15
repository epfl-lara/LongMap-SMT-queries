; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107270 () Bool)

(assert start!107270)

(declare-fun b!1271389 () Bool)

(declare-fun res!845894 () Bool)

(declare-fun e!724997 () Bool)

(assert (=> b!1271389 (=> (not res!845894) (not e!724997))))

(declare-datatypes ((V!49139 0))(
  ( (V!49140 (val!16554 Int)) )
))
(declare-datatypes ((ValueCell!15626 0))(
  ( (ValueCellFull!15626 (v!19190 V!49139)) (EmptyCell!15626) )
))
(declare-datatypes ((array!83077 0))(
  ( (array!83078 (arr!40076 (Array (_ BitVec 32) ValueCell!15626)) (size!40614 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!83077)

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-datatypes ((array!83079 0))(
  ( (array!83080 (arr!40077 (Array (_ BitVec 32) (_ BitVec 64))) (size!40615 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!83079)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1271389 (= res!845894 (and (= (size!40614 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40615 _keys!1364) (size!40614 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1271390 () Bool)

(declare-fun e!724996 () Bool)

(declare-fun e!724995 () Bool)

(declare-fun mapRes!51019 () Bool)

(assert (=> b!1271390 (= e!724996 (and e!724995 mapRes!51019))))

(declare-fun condMapEmpty!51019 () Bool)

(declare-fun mapDefault!51019 () ValueCell!15626)

(assert (=> b!1271390 (= condMapEmpty!51019 (= (arr!40076 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15626)) mapDefault!51019)))))

(declare-fun mapIsEmpty!51019 () Bool)

(assert (=> mapIsEmpty!51019 mapRes!51019))

(declare-fun b!1271391 () Bool)

(assert (=> b!1271391 (= e!724997 false)))

(declare-fun lt!574697 () Bool)

(declare-datatypes ((List!28603 0))(
  ( (Nil!28600) (Cons!28599 (h!29808 (_ BitVec 64)) (t!42124 List!28603)) )
))
(declare-fun arrayNoDuplicates!0 (array!83079 (_ BitVec 32) List!28603) Bool)

(assert (=> b!1271391 (= lt!574697 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28600))))

(declare-fun mapNonEmpty!51019 () Bool)

(declare-fun tp!97361 () Bool)

(declare-fun e!724999 () Bool)

(assert (=> mapNonEmpty!51019 (= mapRes!51019 (and tp!97361 e!724999))))

(declare-fun mapValue!51019 () ValueCell!15626)

(declare-fun mapRest!51019 () (Array (_ BitVec 32) ValueCell!15626))

(declare-fun mapKey!51019 () (_ BitVec 32))

(assert (=> mapNonEmpty!51019 (= (arr!40076 _values!1134) (store mapRest!51019 mapKey!51019 mapValue!51019))))

(declare-fun b!1271392 () Bool)

(declare-fun tp_is_empty!32959 () Bool)

(assert (=> b!1271392 (= e!724995 tp_is_empty!32959)))

(declare-fun res!845893 () Bool)

(assert (=> start!107270 (=> (not res!845893) (not e!724997))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107270 (= res!845893 (validMask!0 mask!1730))))

(assert (=> start!107270 e!724997))

(declare-fun array_inv!30637 (array!83077) Bool)

(assert (=> start!107270 (and (array_inv!30637 _values!1134) e!724996)))

(assert (=> start!107270 true))

(declare-fun array_inv!30638 (array!83079) Bool)

(assert (=> start!107270 (array_inv!30638 _keys!1364)))

(declare-fun b!1271393 () Bool)

(declare-fun res!845892 () Bool)

(assert (=> b!1271393 (=> (not res!845892) (not e!724997))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83079 (_ BitVec 32)) Bool)

(assert (=> b!1271393 (= res!845892 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1271394 () Bool)

(assert (=> b!1271394 (= e!724999 tp_is_empty!32959)))

(assert (= (and start!107270 res!845893) b!1271389))

(assert (= (and b!1271389 res!845894) b!1271393))

(assert (= (and b!1271393 res!845892) b!1271391))

(assert (= (and b!1271390 condMapEmpty!51019) mapIsEmpty!51019))

(assert (= (and b!1271390 (not condMapEmpty!51019)) mapNonEmpty!51019))

(get-info :version)

(assert (= (and mapNonEmpty!51019 ((_ is ValueCellFull!15626) mapValue!51019)) b!1271394))

(assert (= (and b!1271390 ((_ is ValueCellFull!15626) mapDefault!51019)) b!1271392))

(assert (= start!107270 b!1271390))

(declare-fun m!1168899 () Bool)

(assert (=> b!1271391 m!1168899))

(declare-fun m!1168901 () Bool)

(assert (=> mapNonEmpty!51019 m!1168901))

(declare-fun m!1168903 () Bool)

(assert (=> start!107270 m!1168903))

(declare-fun m!1168905 () Bool)

(assert (=> start!107270 m!1168905))

(declare-fun m!1168907 () Bool)

(assert (=> start!107270 m!1168907))

(declare-fun m!1168909 () Bool)

(assert (=> b!1271393 m!1168909))

(check-sat (not b!1271393) (not b!1271391) tp_is_empty!32959 (not mapNonEmpty!51019) (not start!107270))
(check-sat)

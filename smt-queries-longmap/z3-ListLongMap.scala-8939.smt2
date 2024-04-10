; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108362 () Bool)

(assert start!108362)

(declare-fun b!1278929 () Bool)

(declare-fun e!730681 () Bool)

(declare-fun tp_is_empty!33549 () Bool)

(assert (=> b!1278929 (= e!730681 tp_is_empty!33549)))

(declare-fun b!1278930 () Bool)

(declare-fun res!849595 () Bool)

(declare-fun e!730682 () Bool)

(assert (=> b!1278930 (=> (not res!849595) (not e!730682))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!49835 0))(
  ( (V!49836 (val!16849 Int)) )
))
(declare-datatypes ((ValueCell!15876 0))(
  ( (ValueCellFull!15876 (v!19449 V!49835)) (EmptyCell!15876) )
))
(declare-datatypes ((array!84186 0))(
  ( (array!84187 (arr!40597 (Array (_ BitVec 32) ValueCell!15876)) (size!41147 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84186)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!84188 0))(
  ( (array!84189 (arr!40598 (Array (_ BitVec 32) (_ BitVec 64))) (size!41148 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84188)

(assert (=> b!1278930 (= res!849595 (and (= (size!41147 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41148 _keys!1741) (size!41147 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!51875 () Bool)

(declare-fun mapRes!51875 () Bool)

(assert (=> mapIsEmpty!51875 mapRes!51875))

(declare-fun b!1278931 () Bool)

(assert (=> b!1278931 (= e!730682 false)))

(declare-fun lt!575954 () Bool)

(declare-datatypes ((List!28755 0))(
  ( (Nil!28752) (Cons!28751 (h!29960 (_ BitVec 64)) (t!42295 List!28755)) )
))
(declare-fun arrayNoDuplicates!0 (array!84188 (_ BitVec 32) List!28755) Bool)

(assert (=> b!1278931 (= lt!575954 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28752))))

(declare-fun mapNonEmpty!51875 () Bool)

(declare-fun tp!98849 () Bool)

(assert (=> mapNonEmpty!51875 (= mapRes!51875 (and tp!98849 e!730681))))

(declare-fun mapRest!51875 () (Array (_ BitVec 32) ValueCell!15876))

(declare-fun mapKey!51875 () (_ BitVec 32))

(declare-fun mapValue!51875 () ValueCell!15876)

(assert (=> mapNonEmpty!51875 (= (arr!40597 _values!1445) (store mapRest!51875 mapKey!51875 mapValue!51875))))

(declare-fun b!1278932 () Bool)

(declare-fun res!849596 () Bool)

(assert (=> b!1278932 (=> (not res!849596) (not e!730682))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84188 (_ BitVec 32)) Bool)

(assert (=> b!1278932 (= res!849596 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun res!849594 () Bool)

(assert (=> start!108362 (=> (not res!849594) (not e!730682))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108362 (= res!849594 (validMask!0 mask!2175))))

(assert (=> start!108362 e!730682))

(assert (=> start!108362 true))

(declare-fun e!730683 () Bool)

(declare-fun array_inv!30827 (array!84186) Bool)

(assert (=> start!108362 (and (array_inv!30827 _values!1445) e!730683)))

(declare-fun array_inv!30828 (array!84188) Bool)

(assert (=> start!108362 (array_inv!30828 _keys!1741)))

(declare-fun b!1278933 () Bool)

(declare-fun e!730685 () Bool)

(assert (=> b!1278933 (= e!730685 tp_is_empty!33549)))

(declare-fun b!1278934 () Bool)

(assert (=> b!1278934 (= e!730683 (and e!730685 mapRes!51875))))

(declare-fun condMapEmpty!51875 () Bool)

(declare-fun mapDefault!51875 () ValueCell!15876)

(assert (=> b!1278934 (= condMapEmpty!51875 (= (arr!40597 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15876)) mapDefault!51875)))))

(assert (= (and start!108362 res!849594) b!1278930))

(assert (= (and b!1278930 res!849595) b!1278932))

(assert (= (and b!1278932 res!849596) b!1278931))

(assert (= (and b!1278934 condMapEmpty!51875) mapIsEmpty!51875))

(assert (= (and b!1278934 (not condMapEmpty!51875)) mapNonEmpty!51875))

(get-info :version)

(assert (= (and mapNonEmpty!51875 ((_ is ValueCellFull!15876) mapValue!51875)) b!1278929))

(assert (= (and b!1278934 ((_ is ValueCellFull!15876) mapDefault!51875)) b!1278933))

(assert (= start!108362 b!1278934))

(declare-fun m!1174073 () Bool)

(assert (=> b!1278931 m!1174073))

(declare-fun m!1174075 () Bool)

(assert (=> mapNonEmpty!51875 m!1174075))

(declare-fun m!1174077 () Bool)

(assert (=> b!1278932 m!1174077))

(declare-fun m!1174079 () Bool)

(assert (=> start!108362 m!1174079))

(declare-fun m!1174081 () Bool)

(assert (=> start!108362 m!1174081))

(declare-fun m!1174083 () Bool)

(assert (=> start!108362 m!1174083))

(check-sat (not b!1278931) (not mapNonEmpty!51875) (not start!108362) (not b!1278932) tp_is_empty!33549)
(check-sat)

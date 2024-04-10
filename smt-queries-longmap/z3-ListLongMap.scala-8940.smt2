; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108368 () Bool)

(assert start!108368)

(declare-fun mapNonEmpty!51884 () Bool)

(declare-fun mapRes!51884 () Bool)

(declare-fun tp!98858 () Bool)

(declare-fun e!730730 () Bool)

(assert (=> mapNonEmpty!51884 (= mapRes!51884 (and tp!98858 e!730730))))

(declare-datatypes ((V!49843 0))(
  ( (V!49844 (val!16852 Int)) )
))
(declare-datatypes ((ValueCell!15879 0))(
  ( (ValueCellFull!15879 (v!19452 V!49843)) (EmptyCell!15879) )
))
(declare-datatypes ((array!84198 0))(
  ( (array!84199 (arr!40603 (Array (_ BitVec 32) ValueCell!15879)) (size!41153 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84198)

(declare-fun mapRest!51884 () (Array (_ BitVec 32) ValueCell!15879))

(declare-fun mapValue!51884 () ValueCell!15879)

(declare-fun mapKey!51884 () (_ BitVec 32))

(assert (=> mapNonEmpty!51884 (= (arr!40603 _values!1445) (store mapRest!51884 mapKey!51884 mapValue!51884))))

(declare-fun b!1278988 () Bool)

(declare-fun e!730729 () Bool)

(declare-fun tp_is_empty!33555 () Bool)

(assert (=> b!1278988 (= e!730729 tp_is_empty!33555)))

(declare-fun mapIsEmpty!51884 () Bool)

(assert (=> mapIsEmpty!51884 mapRes!51884))

(declare-fun b!1278989 () Bool)

(declare-fun res!849626 () Bool)

(declare-fun e!730726 () Bool)

(assert (=> b!1278989 (=> (not res!849626) (not e!730726))))

(declare-datatypes ((array!84200 0))(
  ( (array!84201 (arr!40604 (Array (_ BitVec 32) (_ BitVec 64))) (size!41154 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84200)

(declare-datatypes ((List!28758 0))(
  ( (Nil!28755) (Cons!28754 (h!29963 (_ BitVec 64)) (t!42298 List!28758)) )
))
(declare-fun arrayNoDuplicates!0 (array!84200 (_ BitVec 32) List!28758) Bool)

(assert (=> b!1278989 (= res!849626 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28755))))

(declare-fun res!849627 () Bool)

(assert (=> start!108368 (=> (not res!849627) (not e!730726))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108368 (= res!849627 (validMask!0 mask!2175))))

(assert (=> start!108368 e!730726))

(assert (=> start!108368 true))

(declare-fun e!730728 () Bool)

(declare-fun array_inv!30831 (array!84198) Bool)

(assert (=> start!108368 (and (array_inv!30831 _values!1445) e!730728)))

(declare-fun array_inv!30832 (array!84200) Bool)

(assert (=> start!108368 (array_inv!30832 _keys!1741)))

(declare-fun b!1278990 () Bool)

(declare-fun res!849628 () Bool)

(assert (=> b!1278990 (=> (not res!849628) (not e!730726))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84200 (_ BitVec 32)) Bool)

(assert (=> b!1278990 (= res!849628 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1278991 () Bool)

(declare-fun res!849629 () Bool)

(assert (=> b!1278991 (=> (not res!849629) (not e!730726))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1278991 (= res!849629 (and (= (size!41153 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41154 _keys!1741) (size!41153 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1278992 () Bool)

(assert (=> b!1278992 (= e!730730 tp_is_empty!33555)))

(declare-fun b!1278993 () Bool)

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1278993 (= e!730726 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41154 _keys!1741)) (bvsgt from!2144 (size!41154 _keys!1741))))))

(declare-fun b!1278994 () Bool)

(assert (=> b!1278994 (= e!730728 (and e!730729 mapRes!51884))))

(declare-fun condMapEmpty!51884 () Bool)

(declare-fun mapDefault!51884 () ValueCell!15879)

(assert (=> b!1278994 (= condMapEmpty!51884 (= (arr!40603 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15879)) mapDefault!51884)))))

(assert (= (and start!108368 res!849627) b!1278991))

(assert (= (and b!1278991 res!849629) b!1278990))

(assert (= (and b!1278990 res!849628) b!1278989))

(assert (= (and b!1278989 res!849626) b!1278993))

(assert (= (and b!1278994 condMapEmpty!51884) mapIsEmpty!51884))

(assert (= (and b!1278994 (not condMapEmpty!51884)) mapNonEmpty!51884))

(get-info :version)

(assert (= (and mapNonEmpty!51884 ((_ is ValueCellFull!15879) mapValue!51884)) b!1278992))

(assert (= (and b!1278994 ((_ is ValueCellFull!15879) mapDefault!51884)) b!1278988))

(assert (= start!108368 b!1278994))

(declare-fun m!1174109 () Bool)

(assert (=> mapNonEmpty!51884 m!1174109))

(declare-fun m!1174111 () Bool)

(assert (=> b!1278989 m!1174111))

(declare-fun m!1174113 () Bool)

(assert (=> start!108368 m!1174113))

(declare-fun m!1174115 () Bool)

(assert (=> start!108368 m!1174115))

(declare-fun m!1174117 () Bool)

(assert (=> start!108368 m!1174117))

(declare-fun m!1174119 () Bool)

(assert (=> b!1278990 m!1174119))

(check-sat (not b!1278989) tp_is_empty!33555 (not mapNonEmpty!51884) (not b!1278990) (not start!108368))
(check-sat)

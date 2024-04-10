; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83382 () Bool)

(assert start!83382)

(declare-fun b_free!19375 () Bool)

(declare-fun b_next!19375 () Bool)

(assert (=> start!83382 (= b_free!19375 (not b_next!19375))))

(declare-fun tp!67404 () Bool)

(declare-fun b_and!30971 () Bool)

(assert (=> start!83382 (= tp!67404 b_and!30971)))

(declare-fun b!973701 () Bool)

(declare-fun e!548852 () Bool)

(declare-fun tp_is_empty!22273 () Bool)

(assert (=> b!973701 (= e!548852 tp_is_empty!22273)))

(declare-fun b!973702 () Bool)

(declare-fun res!651775 () Bool)

(declare-fun e!548850 () Bool)

(assert (=> b!973702 (=> (not res!651775) (not e!548850))))

(declare-datatypes ((array!60587 0))(
  ( (array!60588 (arr!29157 (Array (_ BitVec 32) (_ BitVec 64))) (size!29636 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60587)

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60587 (_ BitVec 32)) Bool)

(assert (=> b!973702 (= res!651775 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!973703 () Bool)

(declare-fun e!548851 () Bool)

(assert (=> b!973703 (= e!548851 tp_is_empty!22273)))

(declare-fun mapNonEmpty!35419 () Bool)

(declare-fun mapRes!35419 () Bool)

(declare-fun tp!67403 () Bool)

(assert (=> mapNonEmpty!35419 (= mapRes!35419 (and tp!67403 e!548852))))

(declare-fun mapKey!35419 () (_ BitVec 32))

(declare-datatypes ((V!34681 0))(
  ( (V!34682 (val!11187 Int)) )
))
(declare-datatypes ((ValueCell!10655 0))(
  ( (ValueCellFull!10655 (v!13746 V!34681)) (EmptyCell!10655) )
))
(declare-fun mapValue!35419 () ValueCell!10655)

(declare-datatypes ((array!60589 0))(
  ( (array!60590 (arr!29158 (Array (_ BitVec 32) ValueCell!10655)) (size!29637 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60589)

(declare-fun mapRest!35419 () (Array (_ BitVec 32) ValueCell!10655))

(assert (=> mapNonEmpty!35419 (= (arr!29158 _values!1425) (store mapRest!35419 mapKey!35419 mapValue!35419))))

(declare-fun b!973704 () Bool)

(declare-fun res!651777 () Bool)

(assert (=> b!973704 (=> (not res!651777) (not e!548850))))

(declare-datatypes ((List!20226 0))(
  ( (Nil!20223) (Cons!20222 (h!21384 (_ BitVec 64)) (t!28699 List!20226)) )
))
(declare-fun arrayNoDuplicates!0 (array!60587 (_ BitVec 32) List!20226) Bool)

(assert (=> b!973704 (= res!651777 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20223))))

(declare-fun b!973705 () Bool)

(declare-fun e!548849 () Bool)

(declare-fun from!2118 () (_ BitVec 32))

(assert (=> b!973705 (= e!548849 (not (bvsle (bvsub from!2118 #b00000000000000000000000000000001) (size!29636 _keys!1717))))))

(declare-datatypes ((tuple2!14368 0))(
  ( (tuple2!14369 (_1!7195 (_ BitVec 64)) (_2!7195 V!34681)) )
))
(declare-fun lt!432659 () tuple2!14368)

(declare-datatypes ((List!20227 0))(
  ( (Nil!20224) (Cons!20223 (h!21385 tuple2!14368) (t!28700 List!20227)) )
))
(declare-datatypes ((ListLongMap!13065 0))(
  ( (ListLongMap!13066 (toList!6548 List!20227)) )
))
(declare-fun lt!432662 () ListLongMap!13065)

(declare-fun i!822 () (_ BitVec 32))

(declare-fun contains!5639 (ListLongMap!13065 (_ BitVec 64)) Bool)

(declare-fun +!2912 (ListLongMap!13065 tuple2!14368) ListLongMap!13065)

(assert (=> b!973705 (contains!5639 (+!2912 lt!432662 lt!432659) (select (arr!29157 _keys!1717) i!822))))

(declare-fun lt!432657 () (_ BitVec 64))

(declare-datatypes ((Unit!32445 0))(
  ( (Unit!32446) )
))
(declare-fun lt!432656 () Unit!32445)

(declare-fun lt!432658 () V!34681)

(declare-fun addStillContains!608 (ListLongMap!13065 (_ BitVec 64) V!34681 (_ BitVec 64)) Unit!32445)

(assert (=> b!973705 (= lt!432656 (addStillContains!608 lt!432662 lt!432657 lt!432658 (select (arr!29157 _keys!1717) i!822)))))

(declare-fun zeroValue!1367 () V!34681)

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34681)

(declare-fun lt!432660 () ListLongMap!13065)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-fun getCurrentListMap!3781 (array!60587 array!60589 (_ BitVec 32) (_ BitVec 32) V!34681 V!34681 (_ BitVec 32) Int) ListLongMap!13065)

(assert (=> b!973705 (= lt!432660 (+!2912 (getCurrentListMap!3781 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvadd #b00000000000000000000000000000001 (bvsub from!2118 #b00000000000000000000000000000001)) defaultEntry!1428) lt!432659))))

(assert (=> b!973705 (= lt!432659 (tuple2!14369 lt!432657 lt!432658))))

(declare-fun get!15117 (ValueCell!10655 V!34681) V!34681)

(declare-fun dynLambda!1701 (Int (_ BitVec 64)) V!34681)

(assert (=> b!973705 (= lt!432658 (get!15117 (select (arr!29158 _values!1425) (bvsub from!2118 #b00000000000000000000000000000001)) (dynLambda!1701 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!432661 () Unit!32445)

(declare-fun lemmaListMapRecursiveValidKeyArray!278 (array!60587 array!60589 (_ BitVec 32) (_ BitVec 32) V!34681 V!34681 (_ BitVec 32) Int) Unit!32445)

(assert (=> b!973705 (= lt!432661 (lemmaListMapRecursiveValidKeyArray!278 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!973706 () Bool)

(declare-fun res!651774 () Bool)

(assert (=> b!973706 (=> (not res!651774) (not e!548850))))

(assert (=> b!973706 (= res!651774 (and (= (size!29637 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29636 _keys!1717) (size!29637 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!973707 () Bool)

(declare-fun e!548853 () Bool)

(assert (=> b!973707 (= e!548853 (and e!548851 mapRes!35419))))

(declare-fun condMapEmpty!35419 () Bool)

(declare-fun mapDefault!35419 () ValueCell!10655)


; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83746 () Bool)

(assert start!83746)

(declare-fun b_free!19555 () Bool)

(declare-fun b_next!19555 () Bool)

(assert (=> start!83746 (= b_free!19555 (not b_next!19555))))

(declare-fun tp!68107 () Bool)

(declare-fun b_and!31205 () Bool)

(assert (=> start!83746 (= tp!68107 b_and!31205)))

(declare-fun mapNonEmpty!35852 () Bool)

(declare-fun mapRes!35852 () Bool)

(declare-fun tp!68106 () Bool)

(declare-fun e!551344 () Bool)

(assert (=> mapNonEmpty!35852 (= mapRes!35852 (and tp!68106 e!551344))))

(declare-datatypes ((V!35049 0))(
  ( (V!35050 (val!11325 Int)) )
))
(declare-datatypes ((ValueCell!10793 0))(
  ( (ValueCellFull!10793 (v!13887 V!35049)) (EmptyCell!10793) )
))
(declare-fun mapValue!35852 () ValueCell!10793)

(declare-datatypes ((array!61125 0))(
  ( (array!61126 (arr!29420 (Array (_ BitVec 32) ValueCell!10793)) (size!29899 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61125)

(declare-fun mapKey!35852 () (_ BitVec 32))

(declare-fun mapRest!35852 () (Array (_ BitVec 32) ValueCell!10793))

(assert (=> mapNonEmpty!35852 (= (arr!29420 _values!1278) (store mapRest!35852 mapKey!35852 mapValue!35852))))

(declare-fun b!977859 () Bool)

(declare-fun res!654411 () Bool)

(declare-fun e!551342 () Bool)

(assert (=> b!977859 (=> (not res!654411) (not e!551342))))

(declare-fun from!1932 () (_ BitVec 32))

(declare-datatypes ((array!61127 0))(
  ( (array!61128 (arr!29421 (Array (_ BitVec 32) (_ BitVec 64))) (size!29900 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61127)

(assert (=> b!977859 (= res!654411 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!29900 _keys!1544))))))

(declare-fun b!977860 () Bool)

(declare-fun e!551343 () Bool)

(declare-fun tp_is_empty!22549 () Bool)

(assert (=> b!977860 (= e!551343 tp_is_empty!22549)))

(declare-fun mapIsEmpty!35852 () Bool)

(assert (=> mapIsEmpty!35852 mapRes!35852))

(declare-fun b!977861 () Bool)

(assert (=> b!977861 (= e!551344 tp_is_empty!22549)))

(declare-fun b!977862 () Bool)

(declare-fun res!654409 () Bool)

(assert (=> b!977862 (=> (not res!654409) (not e!551342))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!977862 (= res!654409 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!977863 () Bool)

(declare-fun e!551346 () Bool)

(assert (=> b!977863 (= e!551346 (and e!551343 mapRes!35852))))

(declare-fun condMapEmpty!35852 () Bool)

(declare-fun mapDefault!35852 () ValueCell!10793)


; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83912 () Bool)

(assert start!83912)

(declare-fun b_free!19721 () Bool)

(declare-fun b_next!19721 () Bool)

(assert (=> start!83912 (= b_free!19721 (not b_next!19721))))

(declare-fun tp!68605 () Bool)

(declare-fun b_and!31531 () Bool)

(assert (=> start!83912 (= tp!68605 b_and!31531)))

(declare-fun b!980661 () Bool)

(declare-fun res!656307 () Bool)

(declare-fun e!552744 () Bool)

(assert (=> b!980661 (=> (not res!656307) (not e!552744))))

(declare-datatypes ((array!61437 0))(
  ( (array!61438 (arr!29576 (Array (_ BitVec 32) (_ BitVec 64))) (size!30055 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61437)

(declare-datatypes ((List!20500 0))(
  ( (Nil!20497) (Cons!20496 (h!21658 (_ BitVec 64)) (t!29177 List!20500)) )
))
(declare-fun arrayNoDuplicates!0 (array!61437 (_ BitVec 32) List!20500) Bool)

(assert (=> b!980661 (= res!656307 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20497))))

(declare-fun b!980662 () Bool)

(declare-fun e!552743 () Bool)

(declare-fun tp_is_empty!22715 () Bool)

(assert (=> b!980662 (= e!552743 tp_is_empty!22715)))

(declare-fun b!980663 () Bool)

(declare-fun res!656308 () Bool)

(assert (=> b!980663 (=> (not res!656308) (not e!552744))))

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!980663 (= res!656308 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30055 _keys!1544))))))

(declare-fun b!980664 () Bool)

(declare-fun res!656303 () Bool)

(assert (=> b!980664 (=> (not res!656303) (not e!552744))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!980664 (= res!656303 (validKeyInArray!0 (select (arr!29576 _keys!1544) from!1932)))))

(declare-fun res!656306 () Bool)

(assert (=> start!83912 (=> (not res!656306) (not e!552744))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83912 (= res!656306 (validMask!0 mask!1948))))

(assert (=> start!83912 e!552744))

(assert (=> start!83912 true))

(assert (=> start!83912 tp_is_empty!22715))

(declare-datatypes ((V!35269 0))(
  ( (V!35270 (val!11408 Int)) )
))
(declare-datatypes ((ValueCell!10876 0))(
  ( (ValueCellFull!10876 (v!13970 V!35269)) (EmptyCell!10876) )
))
(declare-datatypes ((array!61439 0))(
  ( (array!61440 (arr!29577 (Array (_ BitVec 32) ValueCell!10876)) (size!30056 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61439)

(declare-fun e!552741 () Bool)

(declare-fun array_inv!22865 (array!61439) Bool)

(assert (=> start!83912 (and (array_inv!22865 _values!1278) e!552741)))

(assert (=> start!83912 tp!68605))

(declare-fun array_inv!22866 (array!61437) Bool)

(assert (=> start!83912 (array_inv!22866 _keys!1544)))

(declare-fun b!980665 () Bool)

(declare-fun res!656302 () Bool)

(assert (=> b!980665 (=> (not res!656302) (not e!552744))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!980665 (= res!656302 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!980666 () Bool)

(declare-fun e!552742 () Bool)

(assert (=> b!980666 (= e!552742 true)))

(declare-datatypes ((tuple2!14634 0))(
  ( (tuple2!14635 (_1!7328 (_ BitVec 64)) (_2!7328 V!35269)) )
))
(declare-datatypes ((List!20501 0))(
  ( (Nil!20498) (Cons!20497 (h!21659 tuple2!14634) (t!29178 List!20501)) )
))
(declare-datatypes ((ListLongMap!13331 0))(
  ( (ListLongMap!13332 (toList!6681 List!20501)) )
))
(declare-fun lt!435503 () ListLongMap!13331)

(declare-fun lt!435506 () tuple2!14634)

(declare-fun lt!435509 () tuple2!14634)

(declare-fun lt!435505 () ListLongMap!13331)

(declare-fun +!2986 (ListLongMap!13331 tuple2!14634) ListLongMap!13331)

(assert (=> b!980666 (= lt!435503 (+!2986 (+!2986 lt!435505 lt!435509) lt!435506))))

(declare-datatypes ((Unit!32611 0))(
  ( (Unit!32612) )
))
(declare-fun lt!435507 () Unit!32611)

(declare-fun zeroValue!1220 () V!35269)

(declare-fun lt!435508 () V!35269)

(declare-fun addCommutativeForDiffKeys!614 (ListLongMap!13331 (_ BitVec 64) V!35269 (_ BitVec 64) V!35269) Unit!32611)

(assert (=> b!980666 (= lt!435507 (addCommutativeForDiffKeys!614 lt!435505 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!29576 _keys!1544) from!1932) lt!435508))))

(declare-fun b!980667 () Bool)

(declare-fun e!552740 () Bool)

(declare-fun mapRes!36101 () Bool)

(assert (=> b!980667 (= e!552741 (and e!552740 mapRes!36101))))

(declare-fun condMapEmpty!36101 () Bool)

(declare-fun mapDefault!36101 () ValueCell!10876)


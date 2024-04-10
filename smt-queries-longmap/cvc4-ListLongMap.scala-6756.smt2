; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84744 () Bool)

(assert start!84744)

(declare-fun b_free!20099 () Bool)

(declare-fun b_next!20099 () Bool)

(assert (=> start!84744 (= b_free!20099 (not b_next!20099))))

(declare-fun tp!70096 () Bool)

(declare-fun b_and!32273 () Bool)

(assert (=> start!84744 (= tp!70096 b_and!32273)))

(declare-datatypes ((V!36069 0))(
  ( (V!36070 (val!11708 Int)) )
))
(declare-fun minValue!1220 () V!36069)

(declare-datatypes ((ValueCell!11176 0))(
  ( (ValueCellFull!11176 (v!14281 V!36069)) (EmptyCell!11176) )
))
(declare-datatypes ((array!62593 0))(
  ( (array!62594 (arr!30147 (Array (_ BitVec 32) ValueCell!11176)) (size!30626 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62593)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-fun zeroValue!1220 () V!36069)

(declare-fun defaultEntry!1281 () Int)

(declare-fun from!1932 () (_ BitVec 32))

(declare-datatypes ((array!62595 0))(
  ( (array!62596 (arr!30148 (Array (_ BitVec 32) (_ BitVec 64))) (size!30627 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62595)

(declare-fun b!991042 () Bool)

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun e!558842 () Bool)

(declare-datatypes ((tuple2!14932 0))(
  ( (tuple2!14933 (_1!7477 (_ BitVec 64)) (_2!7477 V!36069)) )
))
(declare-datatypes ((List!20859 0))(
  ( (Nil!20856) (Cons!20855 (h!22017 tuple2!14932) (t!29842 List!20859)) )
))
(declare-datatypes ((ListLongMap!13629 0))(
  ( (ListLongMap!13630 (toList!6830 List!20859)) )
))
(declare-fun getCurrentListMap!3880 (array!62595 array!62593 (_ BitVec 32) (_ BitVec 32) V!36069 V!36069 (_ BitVec 32) Int) ListLongMap!13629)

(declare-fun +!3096 (ListLongMap!13629 tuple2!14932) ListLongMap!13629)

(declare-fun get!15653 (ValueCell!11176 V!36069) V!36069)

(declare-fun dynLambda!1877 (Int (_ BitVec 64)) V!36069)

(assert (=> b!991042 (= e!558842 (not (= (getCurrentListMap!3880 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 from!1932 defaultEntry!1281) (+!3096 (getCurrentListMap!3880 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) (tuple2!14933 (select (arr!30148 _keys!1544) from!1932) (get!15653 (select (arr!30147 _values!1278) from!1932) (dynLambda!1877 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!991043 () Bool)

(declare-fun res!662591 () Bool)

(declare-fun e!558840 () Bool)

(assert (=> b!991043 (=> (not res!662591) (not e!558840))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62595 (_ BitVec 32)) Bool)

(assert (=> b!991043 (= res!662591 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!991044 () Bool)

(declare-fun res!662589 () Bool)

(assert (=> b!991044 (=> (not res!662589) (not e!558840))))

(declare-datatypes ((List!20860 0))(
  ( (Nil!20857) (Cons!20856 (h!22018 (_ BitVec 64)) (t!29843 List!20860)) )
))
(declare-fun arrayNoDuplicates!0 (array!62595 (_ BitVec 32) List!20860) Bool)

(assert (=> b!991044 (= res!662589 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20857))))

(declare-fun res!662590 () Bool)

(assert (=> start!84744 (=> (not res!662590) (not e!558840))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84744 (= res!662590 (validMask!0 mask!1948))))

(assert (=> start!84744 e!558840))

(assert (=> start!84744 true))

(declare-fun tp_is_empty!23315 () Bool)

(assert (=> start!84744 tp_is_empty!23315))

(declare-fun e!558844 () Bool)

(declare-fun array_inv!23281 (array!62593) Bool)

(assert (=> start!84744 (and (array_inv!23281 _values!1278) e!558844)))

(assert (=> start!84744 tp!70096))

(declare-fun array_inv!23282 (array!62595) Bool)

(assert (=> start!84744 (array_inv!23282 _keys!1544)))

(declare-fun b!991045 () Bool)

(assert (=> b!991045 (= e!558840 e!558842)))

(declare-fun res!662586 () Bool)

(assert (=> b!991045 (=> (not res!662586) (not e!558842))))

(declare-fun lt!439715 () Bool)

(assert (=> b!991045 (= res!662586 (and (or lt!439715 (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (or lt!439715 (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (or (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not lt!439715))))))

(assert (=> b!991045 (= lt!439715 (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!991046 () Bool)

(declare-fun e!558841 () Bool)

(declare-fun mapRes!37025 () Bool)

(assert (=> b!991046 (= e!558844 (and e!558841 mapRes!37025))))

(declare-fun condMapEmpty!37025 () Bool)

(declare-fun mapDefault!37025 () ValueCell!11176)


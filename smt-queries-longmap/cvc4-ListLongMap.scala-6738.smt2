; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84420 () Bool)

(assert start!84420)

(declare-fun b_free!19991 () Bool)

(declare-fun b_next!19991 () Bool)

(assert (=> start!84420 (= b_free!19991 (not b_next!19991))))

(declare-fun tp!69751 () Bool)

(declare-fun b_and!32045 () Bool)

(assert (=> start!84420 (= tp!69751 b_and!32045)))

(declare-fun b!987470 () Bool)

(declare-fun res!660611 () Bool)

(declare-fun e!556818 () Bool)

(assert (=> b!987470 (=> (not res!660611) (not e!556818))))

(declare-datatypes ((array!62371 0))(
  ( (array!62372 (arr!30042 (Array (_ BitVec 32) (_ BitVec 64))) (size!30521 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62371)

(declare-fun from!1932 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!987470 (= res!660611 (validKeyInArray!0 (select (arr!30042 _keys!1544) from!1932)))))

(declare-fun mapIsEmpty!36842 () Bool)

(declare-fun mapRes!36842 () Bool)

(assert (=> mapIsEmpty!36842 mapRes!36842))

(declare-fun b!987471 () Bool)

(declare-fun res!660612 () Bool)

(assert (=> b!987471 (=> (not res!660612) (not e!556818))))

(assert (=> b!987471 (= res!660612 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30521 _keys!1544))))))

(declare-fun b!987472 () Bool)

(declare-fun res!660614 () Bool)

(assert (=> b!987472 (=> (not res!660614) (not e!556818))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-datatypes ((V!35925 0))(
  ( (V!35926 (val!11654 Int)) )
))
(declare-datatypes ((ValueCell!11122 0))(
  ( (ValueCellFull!11122 (v!14217 V!35925)) (EmptyCell!11122) )
))
(declare-datatypes ((array!62373 0))(
  ( (array!62374 (arr!30043 (Array (_ BitVec 32) ValueCell!11122)) (size!30522 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62373)

(assert (=> b!987472 (= res!660614 (and (= (size!30522 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30521 _keys!1544) (size!30522 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!987473 () Bool)

(declare-fun e!556814 () Bool)

(declare-fun tp_is_empty!23207 () Bool)

(assert (=> b!987473 (= e!556814 tp_is_empty!23207)))

(declare-fun b!987474 () Bool)

(declare-fun res!660613 () Bool)

(assert (=> b!987474 (=> (not res!660613) (not e!556818))))

(declare-datatypes ((List!20776 0))(
  ( (Nil!20773) (Cons!20772 (h!21934 (_ BitVec 64)) (t!29695 List!20776)) )
))
(declare-fun arrayNoDuplicates!0 (array!62371 (_ BitVec 32) List!20776) Bool)

(assert (=> b!987474 (= res!660613 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20773))))

(declare-fun b!987475 () Bool)

(declare-fun res!660617 () Bool)

(assert (=> b!987475 (=> (not res!660617) (not e!556818))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62371 (_ BitVec 32)) Bool)

(assert (=> b!987475 (= res!660617 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!987476 () Bool)

(assert (=> b!987476 (= e!556818 (not (not (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!30042 _keys!1544) from!1932)))))))

(declare-datatypes ((tuple2!14846 0))(
  ( (tuple2!14847 (_1!7434 (_ BitVec 64)) (_2!7434 V!35925)) )
))
(declare-datatypes ((List!20777 0))(
  ( (Nil!20774) (Cons!20773 (h!21935 tuple2!14846) (t!29696 List!20777)) )
))
(declare-datatypes ((ListLongMap!13543 0))(
  ( (ListLongMap!13544 (toList!6787 List!20777)) )
))
(declare-fun lt!437754 () ListLongMap!13543)

(declare-fun lt!437755 () tuple2!14846)

(declare-fun lt!437753 () tuple2!14846)

(declare-fun +!3072 (ListLongMap!13543 tuple2!14846) ListLongMap!13543)

(assert (=> b!987476 (= (+!3072 (+!3072 lt!437754 lt!437755) lt!437753) (+!3072 (+!3072 lt!437754 lt!437753) lt!437755))))

(declare-fun lt!437756 () V!35925)

(assert (=> b!987476 (= lt!437753 (tuple2!14847 (select (arr!30042 _keys!1544) from!1932) lt!437756))))

(declare-fun minValue!1220 () V!35925)

(assert (=> b!987476 (= lt!437755 (tuple2!14847 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32777 0))(
  ( (Unit!32778) )
))
(declare-fun lt!437752 () Unit!32777)

(declare-fun addCommutativeForDiffKeys!696 (ListLongMap!13543 (_ BitVec 64) V!35925 (_ BitVec 64) V!35925) Unit!32777)

(assert (=> b!987476 (= lt!437752 (addCommutativeForDiffKeys!696 lt!437754 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!30042 _keys!1544) from!1932) lt!437756))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15584 (ValueCell!11122 V!35925) V!35925)

(declare-fun dynLambda!1855 (Int (_ BitVec 64)) V!35925)

(assert (=> b!987476 (= lt!437756 (get!15584 (select (arr!30043 _values!1278) from!1932) (dynLambda!1855 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!1220 () V!35925)

(declare-fun getCurrentListMapNoExtraKeys!3478 (array!62371 array!62373 (_ BitVec 32) (_ BitVec 32) V!35925 V!35925 (_ BitVec 32) Int) ListLongMap!13543)

(assert (=> b!987476 (= lt!437754 (+!3072 (getCurrentListMapNoExtraKeys!3478 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) (tuple2!14847 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)))))

(declare-fun b!987477 () Bool)

(declare-fun e!556816 () Bool)

(assert (=> b!987477 (= e!556816 tp_is_empty!23207)))

(declare-fun res!660615 () Bool)

(assert (=> start!84420 (=> (not res!660615) (not e!556818))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84420 (= res!660615 (validMask!0 mask!1948))))

(assert (=> start!84420 e!556818))

(assert (=> start!84420 true))

(assert (=> start!84420 tp_is_empty!23207))

(declare-fun e!556817 () Bool)

(declare-fun array_inv!23211 (array!62373) Bool)

(assert (=> start!84420 (and (array_inv!23211 _values!1278) e!556817)))

(assert (=> start!84420 tp!69751))

(declare-fun array_inv!23212 (array!62371) Bool)

(assert (=> start!84420 (array_inv!23212 _keys!1544)))

(declare-fun b!987478 () Bool)

(declare-fun res!660616 () Bool)

(assert (=> b!987478 (=> (not res!660616) (not e!556818))))

(assert (=> b!987478 (= res!660616 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!36842 () Bool)

(declare-fun tp!69750 () Bool)

(assert (=> mapNonEmpty!36842 (= mapRes!36842 (and tp!69750 e!556814))))

(declare-fun mapRest!36842 () (Array (_ BitVec 32) ValueCell!11122))

(declare-fun mapKey!36842 () (_ BitVec 32))

(declare-fun mapValue!36842 () ValueCell!11122)

(assert (=> mapNonEmpty!36842 (= (arr!30043 _values!1278) (store mapRest!36842 mapKey!36842 mapValue!36842))))

(declare-fun b!987479 () Bool)

(assert (=> b!987479 (= e!556817 (and e!556816 mapRes!36842))))

(declare-fun condMapEmpty!36842 () Bool)

(declare-fun mapDefault!36842 () ValueCell!11122)


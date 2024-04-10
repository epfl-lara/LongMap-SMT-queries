; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84416 () Bool)

(assert start!84416)

(declare-fun b_free!19987 () Bool)

(declare-fun b_next!19987 () Bool)

(assert (=> start!84416 (= b_free!19987 (not b_next!19987))))

(declare-fun tp!69738 () Bool)

(declare-fun b_and!32037 () Bool)

(assert (=> start!84416 (= tp!69738 b_and!32037)))

(declare-fun b!987406 () Bool)

(declare-fun res!660574 () Bool)

(declare-fun e!556784 () Bool)

(assert (=> b!987406 (=> (not res!660574) (not e!556784))))

(declare-datatypes ((array!62363 0))(
  ( (array!62364 (arr!30038 (Array (_ BitVec 32) (_ BitVec 64))) (size!30517 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62363)

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62363 (_ BitVec 32)) Bool)

(assert (=> b!987406 (= res!660574 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!987407 () Bool)

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!987407 (= e!556784 (not (not (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!30038 _keys!1544) from!1932)))))))

(declare-datatypes ((V!35921 0))(
  ( (V!35922 (val!11652 Int)) )
))
(declare-datatypes ((tuple2!14842 0))(
  ( (tuple2!14843 (_1!7432 (_ BitVec 64)) (_2!7432 V!35921)) )
))
(declare-datatypes ((List!20772 0))(
  ( (Nil!20769) (Cons!20768 (h!21930 tuple2!14842) (t!29687 List!20772)) )
))
(declare-datatypes ((ListLongMap!13539 0))(
  ( (ListLongMap!13540 (toList!6785 List!20772)) )
))
(declare-fun lt!437722 () ListLongMap!13539)

(declare-fun lt!437723 () tuple2!14842)

(declare-fun lt!437724 () tuple2!14842)

(declare-fun +!3070 (ListLongMap!13539 tuple2!14842) ListLongMap!13539)

(assert (=> b!987407 (= (+!3070 (+!3070 lt!437722 lt!437723) lt!437724) (+!3070 (+!3070 lt!437722 lt!437724) lt!437723))))

(declare-fun lt!437726 () V!35921)

(assert (=> b!987407 (= lt!437724 (tuple2!14843 (select (arr!30038 _keys!1544) from!1932) lt!437726))))

(declare-fun minValue!1220 () V!35921)

(assert (=> b!987407 (= lt!437723 (tuple2!14843 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32773 0))(
  ( (Unit!32774) )
))
(declare-fun lt!437725 () Unit!32773)

(declare-fun addCommutativeForDiffKeys!694 (ListLongMap!13539 (_ BitVec 64) V!35921 (_ BitVec 64) V!35921) Unit!32773)

(assert (=> b!987407 (= lt!437725 (addCommutativeForDiffKeys!694 lt!437722 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!30038 _keys!1544) from!1932) lt!437726))))

(declare-datatypes ((ValueCell!11120 0))(
  ( (ValueCellFull!11120 (v!14215 V!35921)) (EmptyCell!11120) )
))
(declare-datatypes ((array!62365 0))(
  ( (array!62366 (arr!30039 (Array (_ BitVec 32) ValueCell!11120)) (size!30518 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62365)

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15582 (ValueCell!11120 V!35921) V!35921)

(declare-fun dynLambda!1853 (Int (_ BitVec 64)) V!35921)

(assert (=> b!987407 (= lt!437726 (get!15582 (select (arr!30039 _values!1278) from!1932) (dynLambda!1853 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-fun zeroValue!1220 () V!35921)

(declare-fun getCurrentListMapNoExtraKeys!3476 (array!62363 array!62365 (_ BitVec 32) (_ BitVec 32) V!35921 V!35921 (_ BitVec 32) Int) ListLongMap!13539)

(assert (=> b!987407 (= lt!437722 (+!3070 (getCurrentListMapNoExtraKeys!3476 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) (tuple2!14843 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)))))

(declare-fun b!987408 () Bool)

(declare-fun res!660570 () Bool)

(assert (=> b!987408 (=> (not res!660570) (not e!556784))))

(declare-datatypes ((List!20773 0))(
  ( (Nil!20770) (Cons!20769 (h!21931 (_ BitVec 64)) (t!29688 List!20773)) )
))
(declare-fun arrayNoDuplicates!0 (array!62363 (_ BitVec 32) List!20773) Bool)

(assert (=> b!987408 (= res!660570 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20770))))

(declare-fun mapIsEmpty!36836 () Bool)

(declare-fun mapRes!36836 () Bool)

(assert (=> mapIsEmpty!36836 mapRes!36836))

(declare-fun b!987409 () Bool)

(declare-fun res!660572 () Bool)

(assert (=> b!987409 (=> (not res!660572) (not e!556784))))

(assert (=> b!987409 (= res!660572 (and (= (size!30518 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30517 _keys!1544) (size!30518 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!987410 () Bool)

(declare-fun e!556786 () Bool)

(declare-fun e!556788 () Bool)

(assert (=> b!987410 (= e!556786 (and e!556788 mapRes!36836))))

(declare-fun condMapEmpty!36836 () Bool)

(declare-fun mapDefault!36836 () ValueCell!11120)


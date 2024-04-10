; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84374 () Bool)

(assert start!84374)

(declare-fun b_free!19961 () Bool)

(declare-fun b_next!19961 () Bool)

(assert (=> start!84374 (= b_free!19961 (not b_next!19961))))

(declare-fun tp!69658 () Bool)

(declare-fun b_and!31995 () Bool)

(assert (=> start!84374 (= tp!69658 b_and!31995)))

(declare-fun b!986925 () Bool)

(declare-fun e!556540 () Bool)

(assert (=> b!986925 (= e!556540 false)))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-datatypes ((V!35885 0))(
  ( (V!35886 (val!11639 Int)) )
))
(declare-fun minValue!1220 () V!35885)

(declare-datatypes ((ValueCell!11107 0))(
  ( (ValueCellFull!11107 (v!14201 V!35885)) (EmptyCell!11107) )
))
(declare-datatypes ((array!62313 0))(
  ( (array!62314 (arr!30014 (Array (_ BitVec 32) ValueCell!11107)) (size!30493 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62313)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-fun zeroValue!1220 () V!35885)

(declare-fun defaultEntry!1281 () Int)

(declare-fun from!1932 () (_ BitVec 32))

(declare-datatypes ((array!62315 0))(
  ( (array!62316 (arr!30015 (Array (_ BitVec 32) (_ BitVec 64))) (size!30494 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62315)

(declare-datatypes ((tuple2!14826 0))(
  ( (tuple2!14827 (_1!7424 (_ BitVec 64)) (_2!7424 V!35885)) )
))
(declare-datatypes ((List!20757 0))(
  ( (Nil!20754) (Cons!20753 (h!21915 tuple2!14826) (t!29656 List!20757)) )
))
(declare-datatypes ((ListLongMap!13523 0))(
  ( (ListLongMap!13524 (toList!6777 List!20757)) )
))
(declare-fun lt!437561 () ListLongMap!13523)

(declare-fun +!3062 (ListLongMap!13523 tuple2!14826) ListLongMap!13523)

(declare-fun getCurrentListMapNoExtraKeys!3468 (array!62315 array!62313 (_ BitVec 32) (_ BitVec 32) V!35885 V!35885 (_ BitVec 32) Int) ListLongMap!13523)

(assert (=> b!986925 (= lt!437561 (+!3062 (getCurrentListMapNoExtraKeys!3468 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) (tuple2!14827 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)))))

(declare-fun b!986926 () Bool)

(declare-fun res!660268 () Bool)

(assert (=> b!986926 (=> (not res!660268) (not e!556540))))

(assert (=> b!986926 (= res!660268 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30494 _keys!1544))))))

(declare-fun b!986927 () Bool)

(declare-fun res!660269 () Bool)

(assert (=> b!986927 (=> (not res!660269) (not e!556540))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!986927 (= res!660269 (validKeyInArray!0 (select (arr!30015 _keys!1544) from!1932)))))

(declare-fun b!986928 () Bool)

(declare-fun e!556538 () Bool)

(declare-fun tp_is_empty!23177 () Bool)

(assert (=> b!986928 (= e!556538 tp_is_empty!23177)))

(declare-fun res!660264 () Bool)

(assert (=> start!84374 (=> (not res!660264) (not e!556540))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84374 (= res!660264 (validMask!0 mask!1948))))

(assert (=> start!84374 e!556540))

(assert (=> start!84374 true))

(assert (=> start!84374 tp_is_empty!23177))

(declare-fun e!556541 () Bool)

(declare-fun array_inv!23193 (array!62313) Bool)

(assert (=> start!84374 (and (array_inv!23193 _values!1278) e!556541)))

(assert (=> start!84374 tp!69658))

(declare-fun array_inv!23194 (array!62315) Bool)

(assert (=> start!84374 (array_inv!23194 _keys!1544)))

(declare-fun b!986929 () Bool)

(declare-fun mapRes!36794 () Bool)

(assert (=> b!986929 (= e!556541 (and e!556538 mapRes!36794))))

(declare-fun condMapEmpty!36794 () Bool)

(declare-fun mapDefault!36794 () ValueCell!11107)


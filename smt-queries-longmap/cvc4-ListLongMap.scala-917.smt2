; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20602 () Bool)

(assert start!20602)

(declare-fun b_free!5261 () Bool)

(declare-fun b_next!5261 () Bool)

(assert (=> start!20602 (= b_free!5261 (not b_next!5261))))

(declare-fun tp!18815 () Bool)

(declare-fun b_and!12007 () Bool)

(assert (=> start!20602 (= tp!18815 b_and!12007)))

(declare-fun b!205344 () Bool)

(declare-fun res!99188 () Bool)

(declare-fun e!134294 () Bool)

(assert (=> b!205344 (=> (not res!99188) (not e!134294))))

(declare-datatypes ((array!9447 0))(
  ( (array!9448 (arr!4474 (Array (_ BitVec 32) (_ BitVec 64))) (size!4799 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9447)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((V!6469 0))(
  ( (V!6470 (val!2603 Int)) )
))
(declare-datatypes ((ValueCell!2215 0))(
  ( (ValueCellFull!2215 (v!4573 V!6469)) (EmptyCell!2215) )
))
(declare-datatypes ((array!9449 0))(
  ( (array!9450 (arr!4475 (Array (_ BitVec 32) ValueCell!2215)) (size!4800 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9449)

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!205344 (= res!99188 (and (= (size!4800 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4799 _keys!825) (size!4800 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!205345 () Bool)

(declare-fun e!134289 () Bool)

(declare-fun tp_is_empty!5117 () Bool)

(assert (=> b!205345 (= e!134289 tp_is_empty!5117)))

(declare-fun mapNonEmpty!8744 () Bool)

(declare-fun mapRes!8744 () Bool)

(declare-fun tp!18814 () Bool)

(declare-fun e!134291 () Bool)

(assert (=> mapNonEmpty!8744 (= mapRes!8744 (and tp!18814 e!134291))))

(declare-fun mapValue!8744 () ValueCell!2215)

(declare-fun mapRest!8744 () (Array (_ BitVec 32) ValueCell!2215))

(declare-fun mapKey!8744 () (_ BitVec 32))

(assert (=> mapNonEmpty!8744 (= (arr!4475 _values!649) (store mapRest!8744 mapKey!8744 mapValue!8744))))

(declare-fun res!99190 () Bool)

(assert (=> start!20602 (=> (not res!99190) (not e!134294))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20602 (= res!99190 (validMask!0 mask!1149))))

(assert (=> start!20602 e!134294))

(declare-fun e!134288 () Bool)

(declare-fun array_inv!2957 (array!9449) Bool)

(assert (=> start!20602 (and (array_inv!2957 _values!649) e!134288)))

(assert (=> start!20602 true))

(assert (=> start!20602 tp_is_empty!5117))

(declare-fun array_inv!2958 (array!9447) Bool)

(assert (=> start!20602 (array_inv!2958 _keys!825)))

(assert (=> start!20602 tp!18815))

(declare-fun b!205346 () Bool)

(declare-fun res!99185 () Bool)

(assert (=> b!205346 (=> (not res!99185) (not e!134294))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!205346 (= res!99185 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4799 _keys!825))))))

(declare-fun b!205347 () Bool)

(declare-fun res!99192 () Bool)

(assert (=> b!205347 (=> (not res!99192) (not e!134294))))

(declare-fun k!843 () (_ BitVec 64))

(assert (=> b!205347 (= res!99192 (= (select (arr!4474 _keys!825) i!601) k!843))))

(declare-fun b!205348 () Bool)

(assert (=> b!205348 (= e!134291 tp_is_empty!5117)))

(declare-fun b!205349 () Bool)

(declare-fun e!134290 () Bool)

(assert (=> b!205349 (= e!134294 (not e!134290))))

(declare-fun res!99187 () Bool)

(assert (=> b!205349 (=> res!99187 e!134290)))

(assert (=> b!205349 (= res!99187 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!3948 0))(
  ( (tuple2!3949 (_1!1985 (_ BitVec 64)) (_2!1985 V!6469)) )
))
(declare-datatypes ((List!2846 0))(
  ( (Nil!2843) (Cons!2842 (h!3484 tuple2!3948) (t!7777 List!2846)) )
))
(declare-datatypes ((ListLongMap!2861 0))(
  ( (ListLongMap!2862 (toList!1446 List!2846)) )
))
(declare-fun lt!104478 () ListLongMap!2861)

(declare-fun zeroValue!615 () V!6469)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6469)

(declare-fun getCurrentListMap!1017 (array!9447 array!9449 (_ BitVec 32) (_ BitVec 32) V!6469 V!6469 (_ BitVec 32) Int) ListLongMap!2861)

(assert (=> b!205349 (= lt!104478 (getCurrentListMap!1017 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!104484 () array!9449)

(declare-fun lt!104483 () ListLongMap!2861)

(assert (=> b!205349 (= lt!104483 (getCurrentListMap!1017 _keys!825 lt!104484 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!104485 () ListLongMap!2861)

(declare-fun lt!104479 () ListLongMap!2861)

(assert (=> b!205349 (and (= lt!104485 lt!104479) (= lt!104479 lt!104485))))

(declare-fun lt!104477 () ListLongMap!2861)

(declare-fun lt!104481 () tuple2!3948)

(declare-fun +!473 (ListLongMap!2861 tuple2!3948) ListLongMap!2861)

(assert (=> b!205349 (= lt!104479 (+!473 lt!104477 lt!104481))))

(declare-fun v!520 () V!6469)

(assert (=> b!205349 (= lt!104481 (tuple2!3949 k!843 v!520))))

(declare-datatypes ((Unit!6238 0))(
  ( (Unit!6239) )
))
(declare-fun lt!104476 () Unit!6238)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!130 (array!9447 array!9449 (_ BitVec 32) (_ BitVec 32) V!6469 V!6469 (_ BitVec 32) (_ BitVec 64) V!6469 (_ BitVec 32) Int) Unit!6238)

(assert (=> b!205349 (= lt!104476 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!130 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!391 (array!9447 array!9449 (_ BitVec 32) (_ BitVec 32) V!6469 V!6469 (_ BitVec 32) Int) ListLongMap!2861)

(assert (=> b!205349 (= lt!104485 (getCurrentListMapNoExtraKeys!391 _keys!825 lt!104484 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!205349 (= lt!104484 (array!9450 (store (arr!4475 _values!649) i!601 (ValueCellFull!2215 v!520)) (size!4800 _values!649)))))

(assert (=> b!205349 (= lt!104477 (getCurrentListMapNoExtraKeys!391 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!205350 () Bool)

(declare-fun res!99191 () Bool)

(assert (=> b!205350 (=> (not res!99191) (not e!134294))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9447 (_ BitVec 32)) Bool)

(assert (=> b!205350 (= res!99191 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!205351 () Bool)

(declare-fun res!99193 () Bool)

(assert (=> b!205351 (=> (not res!99193) (not e!134294))))

(declare-datatypes ((List!2847 0))(
  ( (Nil!2844) (Cons!2843 (h!3485 (_ BitVec 64)) (t!7778 List!2847)) )
))
(declare-fun arrayNoDuplicates!0 (array!9447 (_ BitVec 32) List!2847) Bool)

(assert (=> b!205351 (= res!99193 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2844))))

(declare-fun mapIsEmpty!8744 () Bool)

(assert (=> mapIsEmpty!8744 mapRes!8744))

(declare-fun b!205352 () Bool)

(declare-fun res!99189 () Bool)

(assert (=> b!205352 (=> (not res!99189) (not e!134294))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!205352 (= res!99189 (validKeyInArray!0 k!843))))

(declare-fun b!205353 () Bool)

(assert (=> b!205353 (= e!134288 (and e!134289 mapRes!8744))))

(declare-fun condMapEmpty!8744 () Bool)

(declare-fun mapDefault!8744 () ValueCell!2215)


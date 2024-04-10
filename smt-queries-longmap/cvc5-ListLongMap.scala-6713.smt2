; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84250 () Bool)

(assert start!84250)

(declare-fun b_free!19951 () Bool)

(declare-fun b_next!19951 () Bool)

(assert (=> start!84250 (= b_free!19951 (not b_next!19951))))

(declare-fun tp!69456 () Bool)

(declare-fun b_and!31979 () Bool)

(assert (=> start!84250 (= tp!69456 b_and!31979)))

(declare-fun b!985682 () Bool)

(declare-fun e!555602 () Bool)

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!985682 (= e!555602 (not (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!35721 0))(
  ( (V!35722 (val!11577 Int)) )
))
(declare-datatypes ((tuple2!14820 0))(
  ( (tuple2!14821 (_1!7421 (_ BitVec 64)) (_2!7421 V!35721)) )
))
(declare-datatypes ((List!20710 0))(
  ( (Nil!20707) (Cons!20706 (h!21868 tuple2!14820) (t!29605 List!20710)) )
))
(declare-datatypes ((ListLongMap!13517 0))(
  ( (ListLongMap!13518 (toList!6774 List!20710)) )
))
(declare-fun lt!437347 () ListLongMap!13517)

(declare-fun lt!437348 () tuple2!14820)

(declare-fun lt!437351 () tuple2!14820)

(declare-fun +!3059 (ListLongMap!13517 tuple2!14820) ListLongMap!13517)

(assert (=> b!985682 (= (+!3059 (+!3059 lt!437347 lt!437348) lt!437351) (+!3059 (+!3059 lt!437347 lt!437351) lt!437348))))

(declare-fun lt!437350 () V!35721)

(declare-datatypes ((array!62081 0))(
  ( (array!62082 (arr!29898 (Array (_ BitVec 32) (_ BitVec 64))) (size!30377 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62081)

(assert (=> b!985682 (= lt!437351 (tuple2!14821 (select (arr!29898 _keys!1544) from!1932) lt!437350))))

(declare-fun minValue!1220 () V!35721)

(assert (=> b!985682 (= lt!437348 (tuple2!14821 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32757 0))(
  ( (Unit!32758) )
))
(declare-fun lt!437349 () Unit!32757)

(declare-fun addCommutativeForDiffKeys!687 (ListLongMap!13517 (_ BitVec 64) V!35721 (_ BitVec 64) V!35721) Unit!32757)

(assert (=> b!985682 (= lt!437349 (addCommutativeForDiffKeys!687 lt!437347 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29898 _keys!1544) from!1932) lt!437350))))

(declare-fun res!659584 () Bool)

(declare-fun e!555605 () Bool)

(assert (=> start!84250 (=> (not res!659584) (not e!555605))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84250 (= res!659584 (validMask!0 mask!1948))))

(assert (=> start!84250 e!555605))

(assert (=> start!84250 true))

(declare-fun tp_is_empty!23053 () Bool)

(assert (=> start!84250 tp_is_empty!23053))

(declare-datatypes ((ValueCell!11045 0))(
  ( (ValueCellFull!11045 (v!14139 V!35721)) (EmptyCell!11045) )
))
(declare-datatypes ((array!62083 0))(
  ( (array!62084 (arr!29899 (Array (_ BitVec 32) ValueCell!11045)) (size!30378 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62083)

(declare-fun e!555603 () Bool)

(declare-fun array_inv!23109 (array!62083) Bool)

(assert (=> start!84250 (and (array_inv!23109 _values!1278) e!555603)))

(assert (=> start!84250 tp!69456))

(declare-fun array_inv!23110 (array!62081) Bool)

(assert (=> start!84250 (array_inv!23110 _keys!1544)))

(declare-fun b!985683 () Bool)

(declare-fun res!659585 () Bool)

(assert (=> b!985683 (=> (not res!659585) (not e!555605))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!985683 (= res!659585 (validKeyInArray!0 (select (arr!29898 _keys!1544) from!1932)))))

(declare-fun b!985684 () Bool)

(assert (=> b!985684 (= e!555605 e!555602)))

(declare-fun res!659589 () Bool)

(assert (=> b!985684 (=> (not res!659589) (not e!555602))))

(assert (=> b!985684 (= res!659589 (not (= #b1000000000000000000000000000000000000000000000000000000000000000 (select (arr!29898 _keys!1544) from!1932))))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15524 (ValueCell!11045 V!35721) V!35721)

(declare-fun dynLambda!1845 (Int (_ BitVec 64)) V!35721)

(assert (=> b!985684 (= lt!437350 (get!15524 (select (arr!29899 _values!1278) from!1932) (dynLambda!1845 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-fun zeroValue!1220 () V!35721)

(declare-fun getCurrentListMapNoExtraKeys!3465 (array!62081 array!62083 (_ BitVec 32) (_ BitVec 32) V!35721 V!35721 (_ BitVec 32) Int) ListLongMap!13517)

(assert (=> b!985684 (= lt!437347 (getCurrentListMapNoExtraKeys!3465 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!985685 () Bool)

(declare-fun res!659587 () Bool)

(assert (=> b!985685 (=> (not res!659587) (not e!555605))))

(assert (=> b!985685 (= res!659587 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30377 _keys!1544))))))

(declare-fun b!985686 () Bool)

(declare-fun e!555604 () Bool)

(assert (=> b!985686 (= e!555604 tp_is_empty!23053)))

(declare-fun b!985687 () Bool)

(declare-fun res!659588 () Bool)

(assert (=> b!985687 (=> (not res!659588) (not e!555605))))

(assert (=> b!985687 (= res!659588 (and (= (size!30378 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30377 _keys!1544) (size!30378 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!985688 () Bool)

(declare-fun res!659586 () Bool)

(assert (=> b!985688 (=> (not res!659586) (not e!555605))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62081 (_ BitVec 32)) Bool)

(assert (=> b!985688 (= res!659586 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!985689 () Bool)

(declare-fun e!555606 () Bool)

(declare-fun mapRes!36608 () Bool)

(assert (=> b!985689 (= e!555603 (and e!555606 mapRes!36608))))

(declare-fun condMapEmpty!36608 () Bool)

(declare-fun mapDefault!36608 () ValueCell!11045)


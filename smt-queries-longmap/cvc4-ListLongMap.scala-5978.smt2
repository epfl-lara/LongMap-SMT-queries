; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77698 () Bool)

(assert start!77698)

(declare-fun b_free!16283 () Bool)

(declare-fun b_next!16283 () Bool)

(assert (=> start!77698 (= b_free!16283 (not b_next!16283))))

(declare-fun tp!57111 () Bool)

(declare-fun b_and!26719 () Bool)

(assert (=> start!77698 (= tp!57111 b_and!26719)))

(declare-fun b!906312 () Bool)

(declare-fun e!507894 () Bool)

(declare-fun e!507896 () Bool)

(assert (=> b!906312 (= e!507894 e!507896)))

(declare-fun res!611637 () Bool)

(assert (=> b!906312 (=> (not res!611637) (not e!507896))))

(declare-datatypes ((V!29899 0))(
  ( (V!29900 (val!9401 Int)) )
))
(declare-datatypes ((tuple2!12236 0))(
  ( (tuple2!12237 (_1!6129 (_ BitVec 64)) (_2!6129 V!29899)) )
))
(declare-datatypes ((List!18043 0))(
  ( (Nil!18040) (Cons!18039 (h!19185 tuple2!12236) (t!25498 List!18043)) )
))
(declare-datatypes ((ListLongMap!10933 0))(
  ( (ListLongMap!10934 (toList!5482 List!18043)) )
))
(declare-fun lt!408875 () ListLongMap!10933)

(declare-fun k!1033 () (_ BitVec 64))

(declare-fun contains!4527 (ListLongMap!10933 (_ BitVec 64)) Bool)

(assert (=> b!906312 (= res!611637 (contains!4527 lt!408875 k!1033))))

(declare-datatypes ((ValueCell!8869 0))(
  ( (ValueCellFull!8869 (v!11906 V!29899)) (EmptyCell!8869) )
))
(declare-datatypes ((array!53444 0))(
  ( (array!53445 (arr!25681 (Array (_ BitVec 32) ValueCell!8869)) (size!26140 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53444)

(declare-fun defaultEntry!1160 () Int)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!29899)

(declare-datatypes ((array!53446 0))(
  ( (array!53447 (arr!25682 (Array (_ BitVec 32) (_ BitVec 64))) (size!26141 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53446)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29899)

(declare-fun getCurrentListMap!2748 (array!53446 array!53444 (_ BitVec 32) (_ BitVec 32) V!29899 V!29899 (_ BitVec 32) Int) ListLongMap!10933)

(assert (=> b!906312 (= lt!408875 (getCurrentListMap!2748 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun b!906313 () Bool)

(declare-fun res!611632 () Bool)

(assert (=> b!906313 (=> (not res!611632) (not e!507896))))

(declare-fun i!717 () (_ BitVec 32))

(assert (=> b!906313 (= res!611632 (and (= (select (arr!25682 _keys!1386) i!717) k!1033) (not (= k!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!906314 () Bool)

(declare-fun e!507897 () Bool)

(assert (=> b!906314 (= e!507896 (not e!507897))))

(declare-fun res!611638 () Bool)

(assert (=> b!906314 (=> res!611638 e!507897)))

(assert (=> b!906314 (= res!611638 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26141 _keys!1386))))))

(declare-fun lt!408874 () V!29899)

(declare-fun get!13499 (ValueCell!8869 V!29899) V!29899)

(declare-fun dynLambda!1345 (Int (_ BitVec 64)) V!29899)

(assert (=> b!906314 (= lt!408874 (get!13499 (select (arr!25681 _values!1152) i!717) (dynLambda!1345 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!53446 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!906314 (arrayContainsKey!0 _keys!1386 k!1033 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!30758 0))(
  ( (Unit!30759) )
))
(declare-fun lt!408872 () Unit!30758)

(declare-fun lemmaKeyInListMapIsInArray!217 (array!53446 array!53444 (_ BitVec 32) (_ BitVec 32) V!29899 V!29899 (_ BitVec 64) Int) Unit!30758)

(assert (=> b!906314 (= lt!408872 (lemmaKeyInListMapIsInArray!217 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k!1033 defaultEntry!1160))))

(declare-fun res!611636 () Bool)

(assert (=> start!77698 (=> (not res!611636) (not e!507894))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77698 (= res!611636 (validMask!0 mask!1756))))

(assert (=> start!77698 e!507894))

(declare-fun e!507890 () Bool)

(declare-fun array_inv!20120 (array!53444) Bool)

(assert (=> start!77698 (and (array_inv!20120 _values!1152) e!507890)))

(assert (=> start!77698 tp!57111))

(assert (=> start!77698 true))

(declare-fun tp_is_empty!18701 () Bool)

(assert (=> start!77698 tp_is_empty!18701))

(declare-fun array_inv!20121 (array!53446) Bool)

(assert (=> start!77698 (array_inv!20121 _keys!1386)))

(declare-fun b!906315 () Bool)

(declare-fun e!507892 () Bool)

(assert (=> b!906315 (= e!507892 tp_is_empty!18701)))

(declare-fun mapNonEmpty!29764 () Bool)

(declare-fun mapRes!29764 () Bool)

(declare-fun tp!57110 () Bool)

(declare-fun e!507895 () Bool)

(assert (=> mapNonEmpty!29764 (= mapRes!29764 (and tp!57110 e!507895))))

(declare-fun mapKey!29764 () (_ BitVec 32))

(declare-fun mapValue!29764 () ValueCell!8869)

(declare-fun mapRest!29764 () (Array (_ BitVec 32) ValueCell!8869))

(assert (=> mapNonEmpty!29764 (= (arr!25681 _values!1152) (store mapRest!29764 mapKey!29764 mapValue!29764))))

(declare-fun b!906316 () Bool)

(declare-fun res!611639 () Bool)

(assert (=> b!906316 (=> (not res!611639) (not e!507894))))

(assert (=> b!906316 (= res!611639 (and (= (size!26140 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26141 _keys!1386) (size!26140 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!906317 () Bool)

(declare-fun e!507893 () Bool)

(assert (=> b!906317 (= e!507897 e!507893)))

(declare-fun res!611633 () Bool)

(assert (=> b!906317 (=> res!611633 e!507893)))

(declare-fun lt!408876 () ListLongMap!10933)

(assert (=> b!906317 (= res!611633 (not (contains!4527 lt!408876 k!1033)))))

(assert (=> b!906317 (= lt!408876 (getCurrentListMap!2748 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun b!906318 () Bool)

(assert (=> b!906318 (= e!507890 (and e!507892 mapRes!29764))))

(declare-fun condMapEmpty!29764 () Bool)

(declare-fun mapDefault!29764 () ValueCell!8869)


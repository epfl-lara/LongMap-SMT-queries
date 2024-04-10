; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20298 () Bool)

(assert start!20298)

(declare-fun b_free!4957 () Bool)

(declare-fun b_next!4957 () Bool)

(assert (=> start!20298 (= b_free!4957 (not b_next!4957))))

(declare-fun tp!17902 () Bool)

(declare-fun b_and!11703 () Bool)

(assert (=> start!20298 (= tp!17902 b_and!11703)))

(declare-fun b!199904 () Bool)

(declare-fun e!131156 () Bool)

(declare-fun tp_is_empty!4813 () Bool)

(assert (=> b!199904 (= e!131156 tp_is_empty!4813)))

(declare-fun b!199905 () Bool)

(declare-fun res!95118 () Bool)

(declare-fun e!131157 () Bool)

(assert (=> b!199905 (=> (not res!95118) (not e!131157))))

(declare-datatypes ((array!8863 0))(
  ( (array!8864 (arr!4182 (Array (_ BitVec 32) (_ BitVec 64))) (size!4507 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8863)

(declare-fun k!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!199905 (= res!95118 (= (select (arr!4182 _keys!825) i!601) k!843))))

(declare-fun res!95119 () Bool)

(assert (=> start!20298 (=> (not res!95119) (not e!131157))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20298 (= res!95119 (validMask!0 mask!1149))))

(assert (=> start!20298 e!131157))

(declare-datatypes ((V!6065 0))(
  ( (V!6066 (val!2451 Int)) )
))
(declare-datatypes ((ValueCell!2063 0))(
  ( (ValueCellFull!2063 (v!4421 V!6065)) (EmptyCell!2063) )
))
(declare-datatypes ((array!8865 0))(
  ( (array!8866 (arr!4183 (Array (_ BitVec 32) ValueCell!2063)) (size!4508 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8865)

(declare-fun e!131158 () Bool)

(declare-fun array_inv!2749 (array!8865) Bool)

(assert (=> start!20298 (and (array_inv!2749 _values!649) e!131158)))

(assert (=> start!20298 true))

(assert (=> start!20298 tp_is_empty!4813))

(declare-fun array_inv!2750 (array!8863) Bool)

(assert (=> start!20298 (array_inv!2750 _keys!825)))

(assert (=> start!20298 tp!17902))

(declare-fun b!199906 () Bool)

(declare-fun res!95113 () Bool)

(assert (=> b!199906 (=> (not res!95113) (not e!131157))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!199906 (= res!95113 (validKeyInArray!0 k!843))))

(declare-fun mapNonEmpty!8288 () Bool)

(declare-fun mapRes!8288 () Bool)

(declare-fun tp!17903 () Bool)

(declare-fun e!131155 () Bool)

(assert (=> mapNonEmpty!8288 (= mapRes!8288 (and tp!17903 e!131155))))

(declare-fun mapValue!8288 () ValueCell!2063)

(declare-fun mapKey!8288 () (_ BitVec 32))

(declare-fun mapRest!8288 () (Array (_ BitVec 32) ValueCell!2063))

(assert (=> mapNonEmpty!8288 (= (arr!4183 _values!649) (store mapRest!8288 mapKey!8288 mapValue!8288))))

(declare-fun b!199907 () Bool)

(declare-fun res!95114 () Bool)

(assert (=> b!199907 (=> (not res!95114) (not e!131157))))

(assert (=> b!199907 (= res!95114 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4507 _keys!825))))))

(declare-fun mapIsEmpty!8288 () Bool)

(assert (=> mapIsEmpty!8288 mapRes!8288))

(declare-fun b!199908 () Bool)

(assert (=> b!199908 (= e!131155 tp_is_empty!4813)))

(declare-fun b!199909 () Bool)

(declare-fun res!95117 () Bool)

(assert (=> b!199909 (=> (not res!95117) (not e!131157))))

(declare-datatypes ((List!2620 0))(
  ( (Nil!2617) (Cons!2616 (h!3258 (_ BitVec 64)) (t!7551 List!2620)) )
))
(declare-fun arrayNoDuplicates!0 (array!8863 (_ BitVec 32) List!2620) Bool)

(assert (=> b!199909 (= res!95117 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2617))))

(declare-fun b!199910 () Bool)

(assert (=> b!199910 (= e!131158 (and e!131156 mapRes!8288))))

(declare-fun condMapEmpty!8288 () Bool)

(declare-fun mapDefault!8288 () ValueCell!2063)


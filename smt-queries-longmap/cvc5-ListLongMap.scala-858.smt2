; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20244 () Bool)

(assert start!20244)

(declare-fun b_free!4903 () Bool)

(declare-fun b_next!4903 () Bool)

(assert (=> start!20244 (= b_free!4903 (not b_next!4903))))

(declare-fun tp!17741 () Bool)

(declare-fun b_and!11649 () Bool)

(assert (=> start!20244 (= tp!17741 b_and!11649)))

(declare-fun b!199094 () Bool)

(declare-fun res!94551 () Bool)

(declare-fun e!130754 () Bool)

(assert (=> b!199094 (=> (not res!94551) (not e!130754))))

(declare-datatypes ((array!8759 0))(
  ( (array!8760 (arr!4130 (Array (_ BitVec 32) (_ BitVec 64))) (size!4455 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8759)

(declare-datatypes ((V!5993 0))(
  ( (V!5994 (val!2424 Int)) )
))
(declare-datatypes ((ValueCell!2036 0))(
  ( (ValueCellFull!2036 (v!4394 V!5993)) (EmptyCell!2036) )
))
(declare-datatypes ((array!8761 0))(
  ( (array!8762 (arr!4131 (Array (_ BitVec 32) ValueCell!2036)) (size!4456 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8761)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!199094 (= res!94551 (and (= (size!4456 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4455 _keys!825) (size!4456 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!199095 () Bool)

(declare-fun res!94548 () Bool)

(assert (=> b!199095 (=> (not res!94548) (not e!130754))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8759 (_ BitVec 32)) Bool)

(assert (=> b!199095 (= res!94548 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!199096 () Bool)

(declare-fun res!94552 () Bool)

(assert (=> b!199096 (=> (not res!94552) (not e!130754))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!199096 (= res!94552 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4455 _keys!825))))))

(declare-fun b!199097 () Bool)

(declare-fun res!94549 () Bool)

(assert (=> b!199097 (=> (not res!94549) (not e!130754))))

(declare-fun k!843 () (_ BitVec 64))

(assert (=> b!199097 (= res!94549 (= (select (arr!4130 _keys!825) i!601) k!843))))

(declare-fun b!199098 () Bool)

(declare-fun res!94547 () Bool)

(assert (=> b!199098 (=> (not res!94547) (not e!130754))))

(declare-datatypes ((List!2586 0))(
  ( (Nil!2583) (Cons!2582 (h!3224 (_ BitVec 64)) (t!7517 List!2586)) )
))
(declare-fun arrayNoDuplicates!0 (array!8759 (_ BitVec 32) List!2586) Bool)

(assert (=> b!199098 (= res!94547 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2583))))

(declare-fun b!199099 () Bool)

(declare-fun e!130753 () Bool)

(declare-fun tp_is_empty!4759 () Bool)

(assert (=> b!199099 (= e!130753 tp_is_empty!4759)))

(declare-fun b!199100 () Bool)

(assert (=> b!199100 (= e!130754 (not true))))

(declare-datatypes ((tuple2!3670 0))(
  ( (tuple2!3671 (_1!1846 (_ BitVec 64)) (_2!1846 V!5993)) )
))
(declare-datatypes ((List!2587 0))(
  ( (Nil!2584) (Cons!2583 (h!3225 tuple2!3670) (t!7518 List!2587)) )
))
(declare-datatypes ((ListLongMap!2583 0))(
  ( (ListLongMap!2584 (toList!1307 List!2587)) )
))
(declare-fun lt!98162 () ListLongMap!2583)

(declare-fun lt!98160 () ListLongMap!2583)

(assert (=> b!199100 (and (= lt!98162 lt!98160) (= lt!98160 lt!98162))))

(declare-fun lt!98163 () ListLongMap!2583)

(declare-fun v!520 () V!5993)

(declare-fun +!334 (ListLongMap!2583 tuple2!3670) ListLongMap!2583)

(assert (=> b!199100 (= lt!98160 (+!334 lt!98163 (tuple2!3671 k!843 v!520)))))

(declare-fun zeroValue!615 () V!5993)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!5993)

(declare-datatypes ((Unit!5970 0))(
  ( (Unit!5971) )
))
(declare-fun lt!98161 () Unit!5970)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!11 (array!8759 array!8761 (_ BitVec 32) (_ BitVec 32) V!5993 V!5993 (_ BitVec 32) (_ BitVec 64) V!5993 (_ BitVec 32) Int) Unit!5970)

(assert (=> b!199100 (= lt!98161 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!11 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!272 (array!8759 array!8761 (_ BitVec 32) (_ BitVec 32) V!5993 V!5993 (_ BitVec 32) Int) ListLongMap!2583)

(assert (=> b!199100 (= lt!98162 (getCurrentListMapNoExtraKeys!272 _keys!825 (array!8762 (store (arr!4131 _values!649) i!601 (ValueCellFull!2036 v!520)) (size!4456 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!199100 (= lt!98163 (getCurrentListMapNoExtraKeys!272 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun res!94550 () Bool)

(assert (=> start!20244 (=> (not res!94550) (not e!130754))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20244 (= res!94550 (validMask!0 mask!1149))))

(assert (=> start!20244 e!130754))

(declare-fun e!130750 () Bool)

(declare-fun array_inv!2707 (array!8761) Bool)

(assert (=> start!20244 (and (array_inv!2707 _values!649) e!130750)))

(assert (=> start!20244 true))

(assert (=> start!20244 tp_is_empty!4759))

(declare-fun array_inv!2708 (array!8759) Bool)

(assert (=> start!20244 (array_inv!2708 _keys!825)))

(assert (=> start!20244 tp!17741))

(declare-fun b!199101 () Bool)

(declare-fun e!130752 () Bool)

(assert (=> b!199101 (= e!130752 tp_is_empty!4759)))

(declare-fun b!199102 () Bool)

(declare-fun res!94546 () Bool)

(assert (=> b!199102 (=> (not res!94546) (not e!130754))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!199102 (= res!94546 (validKeyInArray!0 k!843))))

(declare-fun b!199103 () Bool)

(declare-fun mapRes!8207 () Bool)

(assert (=> b!199103 (= e!130750 (and e!130753 mapRes!8207))))

(declare-fun condMapEmpty!8207 () Bool)

(declare-fun mapDefault!8207 () ValueCell!2036)


; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20232 () Bool)

(assert start!20232)

(declare-fun b_free!4891 () Bool)

(declare-fun b_next!4891 () Bool)

(assert (=> start!20232 (= b_free!4891 (not b_next!4891))))

(declare-fun tp!17705 () Bool)

(declare-fun b_and!11637 () Bool)

(assert (=> start!20232 (= tp!17705 b_and!11637)))

(declare-fun b!198914 () Bool)

(declare-fun res!94423 () Bool)

(declare-fun e!130660 () Bool)

(assert (=> b!198914 (=> (not res!94423) (not e!130660))))

(declare-datatypes ((array!8735 0))(
  ( (array!8736 (arr!4118 (Array (_ BitVec 32) (_ BitVec 64))) (size!4443 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8735)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((V!5977 0))(
  ( (V!5978 (val!2418 Int)) )
))
(declare-datatypes ((ValueCell!2030 0))(
  ( (ValueCellFull!2030 (v!4388 V!5977)) (EmptyCell!2030) )
))
(declare-datatypes ((array!8737 0))(
  ( (array!8738 (arr!4119 (Array (_ BitVec 32) ValueCell!2030)) (size!4444 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8737)

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!198914 (= res!94423 (and (= (size!4444 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4443 _keys!825) (size!4444 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!198915 () Bool)

(declare-fun res!94422 () Bool)

(assert (=> b!198915 (=> (not res!94422) (not e!130660))))

(declare-fun k!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!198915 (= res!94422 (validKeyInArray!0 k!843))))

(declare-fun b!198916 () Bool)

(declare-fun e!130664 () Bool)

(declare-fun tp_is_empty!4747 () Bool)

(assert (=> b!198916 (= e!130664 tp_is_empty!4747)))

(declare-fun b!198917 () Bool)

(declare-fun res!94420 () Bool)

(assert (=> b!198917 (=> (not res!94420) (not e!130660))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!198917 (= res!94420 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4443 _keys!825))))))

(declare-fun b!198918 () Bool)

(assert (=> b!198918 (= e!130660 (not true))))

(declare-datatypes ((tuple2!3664 0))(
  ( (tuple2!3665 (_1!1843 (_ BitVec 64)) (_2!1843 V!5977)) )
))
(declare-datatypes ((List!2579 0))(
  ( (Nil!2576) (Cons!2575 (h!3217 tuple2!3664) (t!7510 List!2579)) )
))
(declare-datatypes ((ListLongMap!2577 0))(
  ( (ListLongMap!2578 (toList!1304 List!2579)) )
))
(declare-fun lt!98090 () ListLongMap!2577)

(declare-fun lt!98091 () ListLongMap!2577)

(assert (=> b!198918 (and (= lt!98090 lt!98091) (= lt!98091 lt!98090))))

(declare-fun v!520 () V!5977)

(declare-fun lt!98088 () ListLongMap!2577)

(declare-fun +!331 (ListLongMap!2577 tuple2!3664) ListLongMap!2577)

(assert (=> b!198918 (= lt!98091 (+!331 lt!98088 (tuple2!3665 k!843 v!520)))))

(declare-datatypes ((Unit!5964 0))(
  ( (Unit!5965) )
))
(declare-fun lt!98089 () Unit!5964)

(declare-fun zeroValue!615 () V!5977)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!5977)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!8 (array!8735 array!8737 (_ BitVec 32) (_ BitVec 32) V!5977 V!5977 (_ BitVec 32) (_ BitVec 64) V!5977 (_ BitVec 32) Int) Unit!5964)

(assert (=> b!198918 (= lt!98089 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!8 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!269 (array!8735 array!8737 (_ BitVec 32) (_ BitVec 32) V!5977 V!5977 (_ BitVec 32) Int) ListLongMap!2577)

(assert (=> b!198918 (= lt!98090 (getCurrentListMapNoExtraKeys!269 _keys!825 (array!8738 (store (arr!4119 _values!649) i!601 (ValueCellFull!2030 v!520)) (size!4444 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!198918 (= lt!98088 (getCurrentListMapNoExtraKeys!269 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!198919 () Bool)

(declare-fun e!130663 () Bool)

(assert (=> b!198919 (= e!130663 tp_is_empty!4747)))

(declare-fun b!198920 () Bool)

(declare-fun res!94421 () Bool)

(assert (=> b!198920 (=> (not res!94421) (not e!130660))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8735 (_ BitVec 32)) Bool)

(assert (=> b!198920 (= res!94421 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun mapIsEmpty!8189 () Bool)

(declare-fun mapRes!8189 () Bool)

(assert (=> mapIsEmpty!8189 mapRes!8189))

(declare-fun b!198921 () Bool)

(declare-fun res!94425 () Bool)

(assert (=> b!198921 (=> (not res!94425) (not e!130660))))

(assert (=> b!198921 (= res!94425 (= (select (arr!4118 _keys!825) i!601) k!843))))

(declare-fun b!198922 () Bool)

(declare-fun res!94426 () Bool)

(assert (=> b!198922 (=> (not res!94426) (not e!130660))))

(declare-datatypes ((List!2580 0))(
  ( (Nil!2577) (Cons!2576 (h!3218 (_ BitVec 64)) (t!7511 List!2580)) )
))
(declare-fun arrayNoDuplicates!0 (array!8735 (_ BitVec 32) List!2580) Bool)

(assert (=> b!198922 (= res!94426 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2577))))

(declare-fun b!198923 () Bool)

(declare-fun e!130661 () Bool)

(assert (=> b!198923 (= e!130661 (and e!130664 mapRes!8189))))

(declare-fun condMapEmpty!8189 () Bool)

(declare-fun mapDefault!8189 () ValueCell!2030)


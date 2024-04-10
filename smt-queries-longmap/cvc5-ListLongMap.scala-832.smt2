; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20088 () Bool)

(assert start!20088)

(declare-fun b_free!4747 () Bool)

(declare-fun b_next!4747 () Bool)

(assert (=> start!20088 (= b_free!4747 (not b_next!4747))))

(declare-fun tp!17272 () Bool)

(declare-fun b_and!11493 () Bool)

(assert (=> start!20088 (= tp!17272 b_and!11493)))

(declare-fun mapNonEmpty!7973 () Bool)

(declare-fun mapRes!7973 () Bool)

(declare-fun tp!17273 () Bool)

(declare-fun e!129580 () Bool)

(assert (=> mapNonEmpty!7973 (= mapRes!7973 (and tp!17273 e!129580))))

(declare-fun mapKey!7973 () (_ BitVec 32))

(declare-datatypes ((V!5785 0))(
  ( (V!5786 (val!2346 Int)) )
))
(declare-datatypes ((ValueCell!1958 0))(
  ( (ValueCellFull!1958 (v!4316 V!5785)) (EmptyCell!1958) )
))
(declare-datatypes ((array!8463 0))(
  ( (array!8464 (arr!3982 (Array (_ BitVec 32) ValueCell!1958)) (size!4307 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8463)

(declare-fun mapRest!7973 () (Array (_ BitVec 32) ValueCell!1958))

(declare-fun mapValue!7973 () ValueCell!1958)

(assert (=> mapNonEmpty!7973 (= (arr!3982 _values!649) (store mapRest!7973 mapKey!7973 mapValue!7973))))

(declare-fun b!196754 () Bool)

(declare-fun res!92909 () Bool)

(declare-fun e!129582 () Bool)

(assert (=> b!196754 (=> (not res!92909) (not e!129582))))

(declare-datatypes ((array!8465 0))(
  ( (array!8466 (arr!3983 (Array (_ BitVec 32) (_ BitVec 64))) (size!4308 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8465)

(declare-fun k!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!196754 (= res!92909 (= (select (arr!3983 _keys!825) i!601) k!843))))

(declare-fun b!196755 () Bool)

(assert (=> b!196755 (= e!129582 false)))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-datatypes ((tuple2!3574 0))(
  ( (tuple2!3575 (_1!1798 (_ BitVec 64)) (_2!1798 V!5785)) )
))
(declare-datatypes ((List!2486 0))(
  ( (Nil!2483) (Cons!2482 (h!3124 tuple2!3574) (t!7417 List!2486)) )
))
(declare-datatypes ((ListLongMap!2487 0))(
  ( (ListLongMap!2488 (toList!1259 List!2486)) )
))
(declare-fun lt!97650 () ListLongMap!2487)

(declare-fun zeroValue!615 () V!5785)

(declare-fun defaultEntry!657 () Int)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!5785)

(declare-fun getCurrentListMapNoExtraKeys!224 (array!8465 array!8463 (_ BitVec 32) (_ BitVec 32) V!5785 V!5785 (_ BitVec 32) Int) ListLongMap!2487)

(assert (=> b!196755 (= lt!97650 (getCurrentListMapNoExtraKeys!224 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!196756 () Bool)

(declare-fun res!92911 () Bool)

(assert (=> b!196756 (=> (not res!92911) (not e!129582))))

(declare-datatypes ((List!2487 0))(
  ( (Nil!2484) (Cons!2483 (h!3125 (_ BitVec 64)) (t!7418 List!2487)) )
))
(declare-fun arrayNoDuplicates!0 (array!8465 (_ BitVec 32) List!2487) Bool)

(assert (=> b!196756 (= res!92911 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2484))))

(declare-fun b!196757 () Bool)

(declare-fun res!92913 () Bool)

(assert (=> b!196757 (=> (not res!92913) (not e!129582))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8465 (_ BitVec 32)) Bool)

(assert (=> b!196757 (= res!92913 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!196758 () Bool)

(declare-fun res!92912 () Bool)

(assert (=> b!196758 (=> (not res!92912) (not e!129582))))

(assert (=> b!196758 (= res!92912 (and (= (size!4307 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4308 _keys!825) (size!4307 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun res!92908 () Bool)

(assert (=> start!20088 (=> (not res!92908) (not e!129582))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20088 (= res!92908 (validMask!0 mask!1149))))

(assert (=> start!20088 e!129582))

(declare-fun e!129583 () Bool)

(declare-fun array_inv!2597 (array!8463) Bool)

(assert (=> start!20088 (and (array_inv!2597 _values!649) e!129583)))

(assert (=> start!20088 true))

(declare-fun tp_is_empty!4603 () Bool)

(assert (=> start!20088 tp_is_empty!4603))

(declare-fun array_inv!2598 (array!8465) Bool)

(assert (=> start!20088 (array_inv!2598 _keys!825)))

(assert (=> start!20088 tp!17272))

(declare-fun b!196759 () Bool)

(assert (=> b!196759 (= e!129580 tp_is_empty!4603)))

(declare-fun b!196760 () Bool)

(declare-fun res!92910 () Bool)

(assert (=> b!196760 (=> (not res!92910) (not e!129582))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!196760 (= res!92910 (validKeyInArray!0 k!843))))

(declare-fun b!196761 () Bool)

(declare-fun e!129584 () Bool)

(assert (=> b!196761 (= e!129583 (and e!129584 mapRes!7973))))

(declare-fun condMapEmpty!7973 () Bool)

(declare-fun mapDefault!7973 () ValueCell!1958)


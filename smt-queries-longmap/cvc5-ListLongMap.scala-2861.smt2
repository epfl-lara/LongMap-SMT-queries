; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41222 () Bool)

(assert start!41222)

(declare-fun b_free!11065 () Bool)

(declare-fun b_next!11065 () Bool)

(assert (=> start!41222 (= b_free!11065 (not b_next!11065))))

(declare-fun tp!39033 () Bool)

(declare-fun b_and!19385 () Bool)

(assert (=> start!41222 (= tp!39033 b_and!19385)))

(declare-fun res!275621 () Bool)

(declare-fun e!268898 () Bool)

(assert (=> start!41222 (=> (not res!275621) (not e!268898))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!28607 0))(
  ( (array!28608 (arr!13743 (Array (_ BitVec 32) (_ BitVec 64))) (size!14095 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28607)

(assert (=> start!41222 (= res!275621 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!14095 _keys!709))))))

(assert (=> start!41222 e!268898))

(declare-fun tp_is_empty!12403 () Bool)

(assert (=> start!41222 tp_is_empty!12403))

(assert (=> start!41222 tp!39033))

(assert (=> start!41222 true))

(declare-datatypes ((V!17643 0))(
  ( (V!17644 (val!6246 Int)) )
))
(declare-datatypes ((ValueCell!5858 0))(
  ( (ValueCellFull!5858 (v!8528 V!17643)) (EmptyCell!5858) )
))
(declare-datatypes ((array!28609 0))(
  ( (array!28610 (arr!13744 (Array (_ BitVec 32) ValueCell!5858)) (size!14096 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28609)

(declare-fun e!268892 () Bool)

(declare-fun array_inv!9940 (array!28609) Bool)

(assert (=> start!41222 (and (array_inv!9940 _values!549) e!268892)))

(declare-fun array_inv!9941 (array!28607) Bool)

(assert (=> start!41222 (array_inv!9941 _keys!709)))

(declare-fun b!460948 () Bool)

(declare-fun e!268894 () Bool)

(assert (=> b!460948 (= e!268894 tp_is_empty!12403)))

(declare-fun b!460949 () Bool)

(declare-fun res!275626 () Bool)

(assert (=> b!460949 (=> (not res!275626) (not e!268898))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!460949 (= res!275626 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!14095 _keys!709))))))

(declare-fun b!460950 () Bool)

(declare-fun res!275616 () Bool)

(declare-fun e!268895 () Bool)

(assert (=> b!460950 (=> (not res!275616) (not e!268895))))

(assert (=> b!460950 (= res!275616 (bvsle from!863 i!563))))

(declare-fun b!460951 () Bool)

(declare-fun e!268897 () Bool)

(assert (=> b!460951 (= e!268897 tp_is_empty!12403)))

(declare-fun b!460952 () Bool)

(declare-fun res!275625 () Bool)

(assert (=> b!460952 (=> (not res!275625) (not e!268898))))

(declare-datatypes ((List!8313 0))(
  ( (Nil!8310) (Cons!8309 (h!9165 (_ BitVec 64)) (t!14255 List!8313)) )
))
(declare-fun arrayNoDuplicates!0 (array!28607 (_ BitVec 32) List!8313) Bool)

(assert (=> b!460952 (= res!275625 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8310))))

(declare-fun b!460953 () Bool)

(declare-fun e!268896 () Bool)

(assert (=> b!460953 (= e!268895 e!268896)))

(declare-fun res!275615 () Bool)

(assert (=> b!460953 (=> (not res!275615) (not e!268896))))

(assert (=> b!460953 (= res!275615 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!17643)

(declare-fun lt!208842 () array!28609)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun minValue!515 () V!17643)

(declare-fun lt!208839 () array!28607)

(declare-datatypes ((tuple2!8242 0))(
  ( (tuple2!8243 (_1!4132 (_ BitVec 64)) (_2!4132 V!17643)) )
))
(declare-datatypes ((List!8314 0))(
  ( (Nil!8311) (Cons!8310 (h!9166 tuple2!8242) (t!14256 List!8314)) )
))
(declare-datatypes ((ListLongMap!7155 0))(
  ( (ListLongMap!7156 (toList!3593 List!8314)) )
))
(declare-fun lt!208841 () ListLongMap!7155)

(declare-fun getCurrentListMapNoExtraKeys!1773 (array!28607 array!28609 (_ BitVec 32) (_ BitVec 32) V!17643 V!17643 (_ BitVec 32) Int) ListLongMap!7155)

(assert (=> b!460953 (= lt!208841 (getCurrentListMapNoExtraKeys!1773 lt!208839 lt!208842 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!17643)

(assert (=> b!460953 (= lt!208842 (array!28610 (store (arr!13744 _values!549) i!563 (ValueCellFull!5858 v!412)) (size!14096 _values!549)))))

(declare-fun lt!208840 () ListLongMap!7155)

(assert (=> b!460953 (= lt!208840 (getCurrentListMapNoExtraKeys!1773 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!460954 () Bool)

(declare-fun res!275618 () Bool)

(assert (=> b!460954 (=> (not res!275618) (not e!268898))))

(assert (=> b!460954 (= res!275618 (and (= (size!14096 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!14095 _keys!709) (size!14096 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!460955 () Bool)

(declare-fun res!275627 () Bool)

(assert (=> b!460955 (=> (not res!275627) (not e!268898))))

(assert (=> b!460955 (= res!275627 (or (= (select (arr!13743 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13743 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!460956 () Bool)

(declare-fun mapRes!20257 () Bool)

(assert (=> b!460956 (= e!268892 (and e!268897 mapRes!20257))))

(declare-fun condMapEmpty!20257 () Bool)

(declare-fun mapDefault!20257 () ValueCell!5858)


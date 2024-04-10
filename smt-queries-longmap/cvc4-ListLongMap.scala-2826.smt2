; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40924 () Bool)

(assert start!40924)

(declare-fun b_free!10859 () Bool)

(declare-fun b_next!10859 () Bool)

(assert (=> start!40924 (= b_free!10859 (not b_next!10859))))

(declare-fun tp!38403 () Bool)

(declare-fun b_and!19001 () Bool)

(assert (=> start!40924 (= tp!38403 b_and!19001)))

(declare-fun b!454952 () Bool)

(declare-fun res!271184 () Bool)

(declare-fun e!266084 () Bool)

(assert (=> b!454952 (=> (not res!271184) (not e!266084))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!454952 (= res!271184 (validMask!0 mask!1025))))

(declare-fun b!454953 () Bool)

(declare-fun res!271182 () Bool)

(assert (=> b!454953 (=> (not res!271182) (not e!266084))))

(declare-datatypes ((array!28197 0))(
  ( (array!28198 (arr!13542 (Array (_ BitVec 32) (_ BitVec 64))) (size!13894 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28197)

(declare-datatypes ((List!8156 0))(
  ( (Nil!8153) (Cons!8152 (h!9008 (_ BitVec 64)) (t!13984 List!8156)) )
))
(declare-fun arrayNoDuplicates!0 (array!28197 (_ BitVec 32) List!8156) Bool)

(assert (=> b!454953 (= res!271182 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8153))))

(declare-fun b!454954 () Bool)

(declare-fun res!271186 () Bool)

(declare-fun e!266086 () Bool)

(assert (=> b!454954 (=> (not res!271186) (not e!266086))))

(declare-fun lt!206239 () array!28197)

(assert (=> b!454954 (= res!271186 (arrayNoDuplicates!0 lt!206239 #b00000000000000000000000000000000 Nil!8153))))

(declare-fun b!454955 () Bool)

(assert (=> b!454955 (= e!266084 e!266086)))

(declare-fun res!271181 () Bool)

(assert (=> b!454955 (=> (not res!271181) (not e!266086))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28197 (_ BitVec 32)) Bool)

(assert (=> b!454955 (= res!271181 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!206239 mask!1025))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!454955 (= lt!206239 (array!28198 (store (arr!13542 _keys!709) i!563 k!794) (size!13894 _keys!709)))))

(declare-fun b!454956 () Bool)

(declare-fun res!271185 () Bool)

(assert (=> b!454956 (=> (not res!271185) (not e!266084))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!17367 0))(
  ( (V!17368 (val!6143 Int)) )
))
(declare-datatypes ((ValueCell!5755 0))(
  ( (ValueCellFull!5755 (v!8409 V!17367)) (EmptyCell!5755) )
))
(declare-datatypes ((array!28199 0))(
  ( (array!28200 (arr!13543 (Array (_ BitVec 32) ValueCell!5755)) (size!13895 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28199)

(assert (=> b!454956 (= res!271185 (and (= (size!13895 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13894 _keys!709) (size!13895 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun res!271176 () Bool)

(assert (=> start!40924 (=> (not res!271176) (not e!266084))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40924 (= res!271176 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13894 _keys!709))))))

(assert (=> start!40924 e!266084))

(declare-fun tp_is_empty!12197 () Bool)

(assert (=> start!40924 tp_is_empty!12197))

(assert (=> start!40924 tp!38403))

(assert (=> start!40924 true))

(declare-fun e!266085 () Bool)

(declare-fun array_inv!9812 (array!28199) Bool)

(assert (=> start!40924 (and (array_inv!9812 _values!549) e!266085)))

(declare-fun array_inv!9813 (array!28197) Bool)

(assert (=> start!40924 (array_inv!9813 _keys!709)))

(declare-fun mapIsEmpty!19936 () Bool)

(declare-fun mapRes!19936 () Bool)

(assert (=> mapIsEmpty!19936 mapRes!19936))

(declare-fun b!454957 () Bool)

(declare-fun res!271180 () Bool)

(assert (=> b!454957 (=> (not res!271180) (not e!266084))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!454957 (= res!271180 (validKeyInArray!0 k!794))))

(declare-fun b!454958 () Bool)

(declare-fun e!266087 () Bool)

(assert (=> b!454958 (= e!266087 tp_is_empty!12197)))

(declare-fun mapNonEmpty!19936 () Bool)

(declare-fun tp!38404 () Bool)

(assert (=> mapNonEmpty!19936 (= mapRes!19936 (and tp!38404 e!266087))))

(declare-fun mapKey!19936 () (_ BitVec 32))

(declare-fun mapValue!19936 () ValueCell!5755)

(declare-fun mapRest!19936 () (Array (_ BitVec 32) ValueCell!5755))

(assert (=> mapNonEmpty!19936 (= (arr!13543 _values!549) (store mapRest!19936 mapKey!19936 mapValue!19936))))

(declare-fun b!454959 () Bool)

(declare-fun res!271177 () Bool)

(assert (=> b!454959 (=> (not res!271177) (not e!266084))))

(declare-fun arrayContainsKey!0 (array!28197 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!454959 (= res!271177 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!454960 () Bool)

(declare-fun e!266089 () Bool)

(assert (=> b!454960 (= e!266089 tp_is_empty!12197)))

(declare-fun b!454961 () Bool)

(declare-fun res!271179 () Bool)

(assert (=> b!454961 (=> (not res!271179) (not e!266084))))

(assert (=> b!454961 (= res!271179 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13894 _keys!709))))))

(declare-fun b!454962 () Bool)

(declare-fun res!271183 () Bool)

(assert (=> b!454962 (=> (not res!271183) (not e!266086))))

(assert (=> b!454962 (= res!271183 (bvsle from!863 i!563))))

(declare-fun b!454963 () Bool)

(declare-fun res!271178 () Bool)

(assert (=> b!454963 (=> (not res!271178) (not e!266084))))

(assert (=> b!454963 (= res!271178 (or (= (select (arr!13542 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13542 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!454964 () Bool)

(declare-fun res!271187 () Bool)

(assert (=> b!454964 (=> (not res!271187) (not e!266084))))

(assert (=> b!454964 (= res!271187 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!454965 () Bool)

(assert (=> b!454965 (= e!266086 false)))

(declare-fun minValue!515 () V!17367)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!17367)

(declare-datatypes ((tuple2!8094 0))(
  ( (tuple2!8095 (_1!4058 (_ BitVec 64)) (_2!4058 V!17367)) )
))
(declare-datatypes ((List!8157 0))(
  ( (Nil!8154) (Cons!8153 (h!9009 tuple2!8094) (t!13985 List!8157)) )
))
(declare-datatypes ((ListLongMap!7007 0))(
  ( (ListLongMap!7008 (toList!3519 List!8157)) )
))
(declare-fun lt!206240 () ListLongMap!7007)

(declare-fun v!412 () V!17367)

(declare-fun getCurrentListMapNoExtraKeys!1702 (array!28197 array!28199 (_ BitVec 32) (_ BitVec 32) V!17367 V!17367 (_ BitVec 32) Int) ListLongMap!7007)

(assert (=> b!454965 (= lt!206240 (getCurrentListMapNoExtraKeys!1702 lt!206239 (array!28200 (store (arr!13543 _values!549) i!563 (ValueCellFull!5755 v!412)) (size!13895 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!206238 () ListLongMap!7007)

(assert (=> b!454965 (= lt!206238 (getCurrentListMapNoExtraKeys!1702 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!454966 () Bool)

(assert (=> b!454966 (= e!266085 (and e!266089 mapRes!19936))))

(declare-fun condMapEmpty!19936 () Bool)

(declare-fun mapDefault!19936 () ValueCell!5755)


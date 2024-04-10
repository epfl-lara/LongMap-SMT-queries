; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!81788 () Bool)

(assert start!81788)

(declare-fun b!953937 () Bool)

(declare-fun res!638811 () Bool)

(declare-fun e!537417 () Bool)

(assert (=> b!953937 (=> (not res!638811) (not e!537417))))

(declare-datatypes ((array!57807 0))(
  ( (array!57808 (arr!27785 (Array (_ BitVec 32) (_ BitVec 64))) (size!28264 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!57807)

(assert (=> b!953937 (= res!638811 (and (bvsle #b00000000000000000000000000000000 (size!28264 _keys!1441)) (bvslt (size!28264 _keys!1441) #b01111111111111111111111111111111)))))

(declare-fun b!953938 () Bool)

(declare-datatypes ((List!19378 0))(
  ( (Nil!19375) (Cons!19374 (h!20536 (_ BitVec 64)) (t!27739 List!19378)) )
))
(declare-fun noDuplicate!1358 (List!19378) Bool)

(assert (=> b!953938 (= e!537417 (not (noDuplicate!1358 Nil!19375)))))

(declare-fun b!953940 () Bool)

(declare-fun res!638812 () Bool)

(assert (=> b!953940 (=> (not res!638812) (not e!537417))))

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57807 (_ BitVec 32)) Bool)

(assert (=> b!953940 (= res!638812 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun mapNonEmpty!33229 () Bool)

(declare-fun mapRes!33229 () Bool)

(declare-fun tp!63618 () Bool)

(declare-fun e!537418 () Bool)

(assert (=> mapNonEmpty!33229 (= mapRes!33229 (and tp!63618 e!537418))))

(declare-datatypes ((V!32781 0))(
  ( (V!32782 (val!10475 Int)) )
))
(declare-datatypes ((ValueCell!9943 0))(
  ( (ValueCellFull!9943 (v!13029 V!32781)) (EmptyCell!9943) )
))
(declare-fun mapRest!33229 () (Array (_ BitVec 32) ValueCell!9943))

(declare-fun mapValue!33229 () ValueCell!9943)

(declare-datatypes ((array!57809 0))(
  ( (array!57810 (arr!27786 (Array (_ BitVec 32) ValueCell!9943)) (size!28265 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!57809)

(declare-fun mapKey!33229 () (_ BitVec 32))

(assert (=> mapNonEmpty!33229 (= (arr!27786 _values!1197) (store mapRest!33229 mapKey!33229 mapValue!33229))))

(declare-fun b!953941 () Bool)

(declare-fun res!638810 () Bool)

(assert (=> b!953941 (=> (not res!638810) (not e!537417))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(assert (=> b!953941 (= res!638810 (and (= (size!28265 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28264 _keys!1441) (size!28265 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun b!953942 () Bool)

(declare-fun e!537415 () Bool)

(declare-fun e!537419 () Bool)

(assert (=> b!953942 (= e!537415 (and e!537419 mapRes!33229))))

(declare-fun condMapEmpty!33229 () Bool)

(declare-fun mapDefault!33229 () ValueCell!9943)


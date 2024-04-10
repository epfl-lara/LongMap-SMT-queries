; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40888 () Bool)

(assert start!40888)

(declare-fun b_free!10823 () Bool)

(declare-fun b_next!10823 () Bool)

(assert (=> start!40888 (= b_free!10823 (not b_next!10823))))

(declare-fun tp!38296 () Bool)

(declare-fun b_and!18965 () Bool)

(assert (=> start!40888 (= tp!38296 b_and!18965)))

(declare-fun b!454142 () Bool)

(declare-fun res!270533 () Bool)

(declare-fun e!265763 () Bool)

(assert (=> b!454142 (=> (not res!270533) (not e!265763))))

(declare-datatypes ((array!28127 0))(
  ( (array!28128 (arr!13507 (Array (_ BitVec 32) (_ BitVec 64))) (size!13859 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28127)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!17319 0))(
  ( (V!17320 (val!6125 Int)) )
))
(declare-datatypes ((ValueCell!5737 0))(
  ( (ValueCellFull!5737 (v!8391 V!17319)) (EmptyCell!5737) )
))
(declare-datatypes ((array!28129 0))(
  ( (array!28130 (arr!13508 (Array (_ BitVec 32) ValueCell!5737)) (size!13860 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28129)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!454142 (= res!270533 (and (= (size!13860 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13859 _keys!709) (size!13860 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun res!270530 () Bool)

(assert (=> start!40888 (=> (not res!270530) (not e!265763))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40888 (= res!270530 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13859 _keys!709))))))

(assert (=> start!40888 e!265763))

(declare-fun tp_is_empty!12161 () Bool)

(assert (=> start!40888 tp_is_empty!12161))

(assert (=> start!40888 tp!38296))

(assert (=> start!40888 true))

(declare-fun e!265764 () Bool)

(declare-fun array_inv!9782 (array!28129) Bool)

(assert (=> start!40888 (and (array_inv!9782 _values!549) e!265764)))

(declare-fun array_inv!9783 (array!28127) Bool)

(assert (=> start!40888 (array_inv!9783 _keys!709)))

(declare-fun b!454143 () Bool)

(declare-fun e!265762 () Bool)

(assert (=> b!454143 (= e!265762 tp_is_empty!12161)))

(declare-fun mapIsEmpty!19882 () Bool)

(declare-fun mapRes!19882 () Bool)

(assert (=> mapIsEmpty!19882 mapRes!19882))

(declare-fun b!454144 () Bool)

(declare-fun res!270537 () Bool)

(assert (=> b!454144 (=> (not res!270537) (not e!265763))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!454144 (= res!270537 (validKeyInArray!0 k!794))))

(declare-fun b!454145 () Bool)

(declare-fun res!270528 () Bool)

(declare-fun e!265765 () Bool)

(assert (=> b!454145 (=> (not res!270528) (not e!265765))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!454145 (= res!270528 (bvsle from!863 i!563))))

(declare-fun b!454146 () Bool)

(declare-fun res!270532 () Bool)

(assert (=> b!454146 (=> (not res!270532) (not e!265763))))

(declare-fun arrayContainsKey!0 (array!28127 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!454146 (= res!270532 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!454147 () Bool)

(assert (=> b!454147 (= e!265763 e!265765)))

(declare-fun res!270534 () Bool)

(assert (=> b!454147 (=> (not res!270534) (not e!265765))))

(declare-fun lt!206077 () array!28127)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28127 (_ BitVec 32)) Bool)

(assert (=> b!454147 (= res!270534 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!206077 mask!1025))))

(assert (=> b!454147 (= lt!206077 (array!28128 (store (arr!13507 _keys!709) i!563 k!794) (size!13859 _keys!709)))))

(declare-fun b!454148 () Bool)

(declare-fun e!265760 () Bool)

(assert (=> b!454148 (= e!265760 tp_is_empty!12161)))

(declare-fun b!454149 () Bool)

(declare-fun res!270529 () Bool)

(assert (=> b!454149 (=> (not res!270529) (not e!265763))))

(declare-datatypes ((List!8128 0))(
  ( (Nil!8125) (Cons!8124 (h!8980 (_ BitVec 64)) (t!13956 List!8128)) )
))
(declare-fun arrayNoDuplicates!0 (array!28127 (_ BitVec 32) List!8128) Bool)

(assert (=> b!454149 (= res!270529 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8125))))

(declare-fun b!454150 () Bool)

(declare-fun res!270531 () Bool)

(assert (=> b!454150 (=> (not res!270531) (not e!265765))))

(assert (=> b!454150 (= res!270531 (arrayNoDuplicates!0 lt!206077 #b00000000000000000000000000000000 Nil!8125))))

(declare-fun b!454151 () Bool)

(assert (=> b!454151 (= e!265764 (and e!265760 mapRes!19882))))

(declare-fun condMapEmpty!19882 () Bool)

(declare-fun mapDefault!19882 () ValueCell!5737)


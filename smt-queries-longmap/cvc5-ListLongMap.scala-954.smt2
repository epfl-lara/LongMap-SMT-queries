; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20820 () Bool)

(assert start!20820)

(declare-fun b_free!5473 () Bool)

(declare-fun b_next!5473 () Bool)

(assert (=> start!20820 (= b_free!5473 (not b_next!5473))))

(declare-fun tp!19459 () Bool)

(declare-fun b_and!12219 () Bool)

(assert (=> start!20820 (= tp!19459 b_and!12219)))

(declare-fun b!208760 () Bool)

(declare-fun res!101624 () Bool)

(declare-fun e!136108 () Bool)

(assert (=> b!208760 (=> (not res!101624) (not e!136108))))

(declare-datatypes ((array!9873 0))(
  ( (array!9874 (arr!4687 (Array (_ BitVec 32) (_ BitVec 64))) (size!5012 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9873)

(declare-fun k!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!208760 (= res!101624 (= (select (arr!4687 _keys!825) i!601) k!843))))

(declare-fun b!208761 () Bool)

(declare-fun res!101621 () Bool)

(assert (=> b!208761 (=> (not res!101621) (not e!136108))))

(assert (=> b!208761 (= res!101621 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5012 _keys!825))))))

(declare-fun b!208762 () Bool)

(declare-fun res!101622 () Bool)

(assert (=> b!208762 (=> (not res!101622) (not e!136108))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9873 (_ BitVec 32)) Bool)

(assert (=> b!208762 (= res!101622 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun mapNonEmpty!9071 () Bool)

(declare-fun mapRes!9071 () Bool)

(declare-fun tp!19460 () Bool)

(declare-fun e!136106 () Bool)

(assert (=> mapNonEmpty!9071 (= mapRes!9071 (and tp!19460 e!136106))))

(declare-datatypes ((V!6761 0))(
  ( (V!6762 (val!2712 Int)) )
))
(declare-datatypes ((ValueCell!2324 0))(
  ( (ValueCellFull!2324 (v!4682 V!6761)) (EmptyCell!2324) )
))
(declare-fun mapValue!9071 () ValueCell!2324)

(declare-datatypes ((array!9875 0))(
  ( (array!9876 (arr!4688 (Array (_ BitVec 32) ValueCell!2324)) (size!5013 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9875)

(declare-fun mapKey!9071 () (_ BitVec 32))

(declare-fun mapRest!9071 () (Array (_ BitVec 32) ValueCell!2324))

(assert (=> mapNonEmpty!9071 (= (arr!4688 _values!649) (store mapRest!9071 mapKey!9071 mapValue!9071))))

(declare-fun b!208764 () Bool)

(declare-fun res!101623 () Bool)

(assert (=> b!208764 (=> (not res!101623) (not e!136108))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!208764 (= res!101623 (and (= (size!5013 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!5012 _keys!825) (size!5013 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!208765 () Bool)

(declare-fun res!101625 () Bool)

(assert (=> b!208765 (=> (not res!101625) (not e!136108))))

(declare-datatypes ((List!3002 0))(
  ( (Nil!2999) (Cons!2998 (h!3640 (_ BitVec 64)) (t!7933 List!3002)) )
))
(declare-fun arrayNoDuplicates!0 (array!9873 (_ BitVec 32) List!3002) Bool)

(assert (=> b!208765 (= res!101625 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2999))))

(declare-fun b!208766 () Bool)

(declare-fun res!101626 () Bool)

(assert (=> b!208766 (=> (not res!101626) (not e!136108))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!208766 (= res!101626 (validKeyInArray!0 k!843))))

(declare-fun b!208767 () Bool)

(declare-fun e!136105 () Bool)

(declare-fun tp_is_empty!5335 () Bool)

(assert (=> b!208767 (= e!136105 tp_is_empty!5335)))

(declare-fun b!208768 () Bool)

(declare-fun e!136107 () Bool)

(assert (=> b!208768 (= e!136107 (and e!136105 mapRes!9071))))

(declare-fun condMapEmpty!9071 () Bool)

(declare-fun mapDefault!9071 () ValueCell!2324)


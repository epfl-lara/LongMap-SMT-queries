; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20796 () Bool)

(assert start!20796)

(declare-fun b_free!5449 () Bool)

(declare-fun b_next!5449 () Bool)

(assert (=> start!20796 (= b_free!5449 (not b_next!5449))))

(declare-fun tp!19387 () Bool)

(declare-fun b_and!12195 () Bool)

(assert (=> start!20796 (= tp!19387 b_and!12195)))

(declare-fun res!101371 () Bool)

(declare-fun e!135926 () Bool)

(assert (=> start!20796 (=> (not res!101371) (not e!135926))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20796 (= res!101371 (validMask!0 mask!1149))))

(assert (=> start!20796 e!135926))

(declare-datatypes ((V!6729 0))(
  ( (V!6730 (val!2700 Int)) )
))
(declare-datatypes ((ValueCell!2312 0))(
  ( (ValueCellFull!2312 (v!4670 V!6729)) (EmptyCell!2312) )
))
(declare-datatypes ((array!9825 0))(
  ( (array!9826 (arr!4663 (Array (_ BitVec 32) ValueCell!2312)) (size!4988 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9825)

(declare-fun e!135927 () Bool)

(declare-fun array_inv!3093 (array!9825) Bool)

(assert (=> start!20796 (and (array_inv!3093 _values!649) e!135927)))

(assert (=> start!20796 true))

(declare-fun tp_is_empty!5311 () Bool)

(assert (=> start!20796 tp_is_empty!5311))

(declare-datatypes ((array!9827 0))(
  ( (array!9828 (arr!4664 (Array (_ BitVec 32) (_ BitVec 64))) (size!4989 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9827)

(declare-fun array_inv!3094 (array!9827) Bool)

(assert (=> start!20796 (array_inv!3094 _keys!825)))

(assert (=> start!20796 tp!19387))

(declare-fun b!208400 () Bool)

(declare-fun res!101373 () Bool)

(assert (=> b!208400 (=> (not res!101373) (not e!135926))))

(declare-datatypes ((List!2987 0))(
  ( (Nil!2984) (Cons!2983 (h!3625 (_ BitVec 64)) (t!7918 List!2987)) )
))
(declare-fun arrayNoDuplicates!0 (array!9827 (_ BitVec 32) List!2987) Bool)

(assert (=> b!208400 (= res!101373 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2984))))

(declare-fun mapNonEmpty!9035 () Bool)

(declare-fun mapRes!9035 () Bool)

(declare-fun tp!19388 () Bool)

(declare-fun e!135929 () Bool)

(assert (=> mapNonEmpty!9035 (= mapRes!9035 (and tp!19388 e!135929))))

(declare-fun mapValue!9035 () ValueCell!2312)

(declare-fun mapKey!9035 () (_ BitVec 32))

(declare-fun mapRest!9035 () (Array (_ BitVec 32) ValueCell!2312))

(assert (=> mapNonEmpty!9035 (= (arr!4663 _values!649) (store mapRest!9035 mapKey!9035 mapValue!9035))))

(declare-fun b!208401 () Bool)

(declare-fun res!101368 () Bool)

(assert (=> b!208401 (=> (not res!101368) (not e!135926))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!208401 (= res!101368 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4989 _keys!825))))))

(declare-fun b!208402 () Bool)

(assert (=> b!208402 (= e!135926 false)))

(declare-datatypes ((tuple2!4092 0))(
  ( (tuple2!4093 (_1!2057 (_ BitVec 64)) (_2!2057 V!6729)) )
))
(declare-datatypes ((List!2988 0))(
  ( (Nil!2985) (Cons!2984 (h!3626 tuple2!4092) (t!7919 List!2988)) )
))
(declare-datatypes ((ListLongMap!3005 0))(
  ( (ListLongMap!3006 (toList!1518 List!2988)) )
))
(declare-fun lt!106779 () ListLongMap!3005)

(declare-fun v!520 () V!6729)

(declare-fun zeroValue!615 () V!6729)

(declare-fun defaultEntry!657 () Int)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!6729)

(declare-fun getCurrentListMapNoExtraKeys!459 (array!9827 array!9825 (_ BitVec 32) (_ BitVec 32) V!6729 V!6729 (_ BitVec 32) Int) ListLongMap!3005)

(assert (=> b!208402 (= lt!106779 (getCurrentListMapNoExtraKeys!459 _keys!825 (array!9826 (store (arr!4663 _values!649) i!601 (ValueCellFull!2312 v!520)) (size!4988 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!106778 () ListLongMap!3005)

(assert (=> b!208402 (= lt!106778 (getCurrentListMapNoExtraKeys!459 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!208403 () Bool)

(declare-fun res!101370 () Bool)

(assert (=> b!208403 (=> (not res!101370) (not e!135926))))

(declare-fun k!843 () (_ BitVec 64))

(assert (=> b!208403 (= res!101370 (= (select (arr!4664 _keys!825) i!601) k!843))))

(declare-fun b!208404 () Bool)

(declare-fun res!101374 () Bool)

(assert (=> b!208404 (=> (not res!101374) (not e!135926))))

(assert (=> b!208404 (= res!101374 (and (= (size!4988 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4989 _keys!825) (size!4988 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!208405 () Bool)

(declare-fun res!101372 () Bool)

(assert (=> b!208405 (=> (not res!101372) (not e!135926))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!208405 (= res!101372 (validKeyInArray!0 k!843))))

(declare-fun b!208406 () Bool)

(declare-fun e!135925 () Bool)

(assert (=> b!208406 (= e!135925 tp_is_empty!5311)))

(declare-fun b!208407 () Bool)

(declare-fun res!101369 () Bool)

(assert (=> b!208407 (=> (not res!101369) (not e!135926))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9827 (_ BitVec 32)) Bool)

(assert (=> b!208407 (= res!101369 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!208408 () Bool)

(assert (=> b!208408 (= e!135927 (and e!135925 mapRes!9035))))

(declare-fun condMapEmpty!9035 () Bool)

(declare-fun mapDefault!9035 () ValueCell!2312)


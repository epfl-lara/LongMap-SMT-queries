; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35708 () Bool)

(assert start!35708)

(declare-fun res!199341 () Bool)

(declare-fun e!219583 () Bool)

(assert (=> start!35708 (=> (not res!199341) (not e!219583))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35708 (= res!199341 (validMask!0 mask!1842))))

(assert (=> start!35708 e!219583))

(assert (=> start!35708 true))

(declare-datatypes ((V!11859 0))(
  ( (V!11860 (val!4125 Int)) )
))
(declare-datatypes ((ValueCell!3737 0))(
  ( (ValueCellFull!3737 (v!6319 V!11859)) (EmptyCell!3737) )
))
(declare-datatypes ((array!19887 0))(
  ( (array!19888 (arr!9437 (Array (_ BitVec 32) ValueCell!3737)) (size!9789 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19887)

(declare-fun e!219585 () Bool)

(declare-fun array_inv!6940 (array!19887) Bool)

(assert (=> start!35708 (and (array_inv!6940 _values!1208) e!219585)))

(declare-datatypes ((array!19889 0))(
  ( (array!19890 (arr!9438 (Array (_ BitVec 32) (_ BitVec 64))) (size!9790 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19889)

(declare-fun array_inv!6941 (array!19889) Bool)

(assert (=> start!35708 (array_inv!6941 _keys!1456)))

(declare-fun b!358661 () Bool)

(declare-fun res!199340 () Bool)

(assert (=> b!358661 (=> (not res!199340) (not e!219583))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!358661 (= res!199340 (and (= (size!9789 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9790 _keys!1456) (size!9789 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!13749 () Bool)

(declare-fun mapRes!13749 () Bool)

(declare-fun tp!27807 () Bool)

(declare-fun e!219587 () Bool)

(assert (=> mapNonEmpty!13749 (= mapRes!13749 (and tp!27807 e!219587))))

(declare-fun mapValue!13749 () ValueCell!3737)

(declare-fun mapRest!13749 () (Array (_ BitVec 32) ValueCell!3737))

(declare-fun mapKey!13749 () (_ BitVec 32))

(assert (=> mapNonEmpty!13749 (= (arr!9437 _values!1208) (store mapRest!13749 mapKey!13749 mapValue!13749))))

(declare-fun b!358662 () Bool)

(declare-fun e!219584 () Bool)

(declare-fun tp_is_empty!8161 () Bool)

(assert (=> b!358662 (= e!219584 tp_is_empty!8161)))

(declare-fun b!358663 () Bool)

(assert (=> b!358663 (= e!219585 (and e!219584 mapRes!13749))))

(declare-fun condMapEmpty!13749 () Bool)

(declare-fun mapDefault!13749 () ValueCell!3737)


; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78308 () Bool)

(assert start!78308)

(declare-fun b_free!16651 () Bool)

(declare-fun b_next!16651 () Bool)

(assert (=> start!78308 (= b_free!16651 (not b_next!16651))))

(declare-fun tp!58228 () Bool)

(declare-fun b_and!27235 () Bool)

(assert (=> start!78308 (= tp!58228 b_and!27235)))

(declare-fun mapNonEmpty!30328 () Bool)

(declare-fun mapRes!30328 () Bool)

(declare-fun tp!58227 () Bool)

(declare-fun e!512124 () Bool)

(assert (=> mapNonEmpty!30328 (= mapRes!30328 (and tp!58227 e!512124))))

(declare-datatypes ((V!30391 0))(
  ( (V!30392 (val!9585 Int)) )
))
(declare-datatypes ((ValueCell!9053 0))(
  ( (ValueCellFull!9053 (v!12092 V!30391)) (EmptyCell!9053) )
))
(declare-datatypes ((array!54195 0))(
  ( (array!54196 (arr!26048 (Array (_ BitVec 32) ValueCell!9053)) (size!26508 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54195)

(declare-fun mapRest!30328 () (Array (_ BitVec 32) ValueCell!9053))

(declare-fun mapValue!30328 () ValueCell!9053)

(declare-fun mapKey!30328 () (_ BitVec 32))

(assert (=> mapNonEmpty!30328 (= (arr!26048 _values!1152) (store mapRest!30328 mapKey!30328 mapValue!30328))))

(declare-fun mapIsEmpty!30328 () Bool)

(assert (=> mapIsEmpty!30328 mapRes!30328))

(declare-fun res!615576 () Bool)

(declare-fun e!512122 () Bool)

(assert (=> start!78308 (=> (not res!615576) (not e!512122))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78308 (= res!615576 (validMask!0 mask!1756))))

(assert (=> start!78308 e!512122))

(declare-fun e!512121 () Bool)

(declare-fun array_inv!20440 (array!54195) Bool)

(assert (=> start!78308 (and (array_inv!20440 _values!1152) e!512121)))

(assert (=> start!78308 tp!58228))

(assert (=> start!78308 true))

(declare-fun tp_is_empty!19069 () Bool)

(assert (=> start!78308 tp_is_empty!19069))

(declare-datatypes ((array!54197 0))(
  ( (array!54198 (arr!26049 (Array (_ BitVec 32) (_ BitVec 64))) (size!26509 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54197)

(declare-fun array_inv!20441 (array!54197) Bool)

(assert (=> start!78308 (array_inv!20441 _keys!1386)))

(declare-fun b!912880 () Bool)

(declare-fun res!615578 () Bool)

(assert (=> b!912880 (=> (not res!615578) (not e!512122))))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(assert (=> b!912880 (= res!615578 (and (= (size!26508 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26509 _keys!1386) (size!26508 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!912881 () Bool)

(declare-fun res!615575 () Bool)

(assert (=> b!912881 (=> (not res!615575) (not e!512122))))

(declare-datatypes ((List!18270 0))(
  ( (Nil!18267) (Cons!18266 (h!19418 (_ BitVec 64)) (t!25849 List!18270)) )
))
(declare-fun arrayNoDuplicates!0 (array!54197 (_ BitVec 32) List!18270) Bool)

(assert (=> b!912881 (= res!615575 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18267))))

(declare-fun b!912882 () Bool)

(declare-fun res!615577 () Bool)

(assert (=> b!912882 (=> (not res!615577) (not e!512122))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54197 (_ BitVec 32)) Bool)

(assert (=> b!912882 (= res!615577 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!912883 () Bool)

(assert (=> b!912883 (= e!512124 tp_is_empty!19069)))

(declare-fun b!912884 () Bool)

(declare-fun e!512120 () Bool)

(assert (=> b!912884 (= e!512121 (and e!512120 mapRes!30328))))

(declare-fun condMapEmpty!30328 () Bool)

(declare-fun mapDefault!30328 () ValueCell!9053)

(assert (=> b!912884 (= condMapEmpty!30328 (= (arr!26048 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!9053)) mapDefault!30328)))))

(declare-fun b!912885 () Bool)

(assert (=> b!912885 (= e!512120 tp_is_empty!19069)))

(declare-fun b!912886 () Bool)

(assert (=> b!912886 (= e!512122 false)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!30391)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun minValue!1094 () V!30391)

(declare-fun lt!410898 () Bool)

(declare-datatypes ((tuple2!12450 0))(
  ( (tuple2!12451 (_1!6236 (_ BitVec 64)) (_2!6236 V!30391)) )
))
(declare-datatypes ((List!18271 0))(
  ( (Nil!18268) (Cons!18267 (h!19419 tuple2!12450) (t!25850 List!18271)) )
))
(declare-datatypes ((ListLongMap!11149 0))(
  ( (ListLongMap!11150 (toList!5590 List!18271)) )
))
(declare-fun contains!4644 (ListLongMap!11149 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2851 (array!54197 array!54195 (_ BitVec 32) (_ BitVec 32) V!30391 V!30391 (_ BitVec 32) Int) ListLongMap!11149)

(assert (=> b!912886 (= lt!410898 (contains!4644 (getCurrentListMap!2851 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(assert (= (and start!78308 res!615576) b!912880))

(assert (= (and b!912880 res!615578) b!912882))

(assert (= (and b!912882 res!615577) b!912881))

(assert (= (and b!912881 res!615575) b!912886))

(assert (= (and b!912884 condMapEmpty!30328) mapIsEmpty!30328))

(assert (= (and b!912884 (not condMapEmpty!30328)) mapNonEmpty!30328))

(get-info :version)

(assert (= (and mapNonEmpty!30328 ((_ is ValueCellFull!9053) mapValue!30328)) b!912883))

(assert (= (and b!912884 ((_ is ValueCellFull!9053) mapDefault!30328)) b!912885))

(assert (= start!78308 b!912884))

(declare-fun m!847893 () Bool)

(assert (=> b!912881 m!847893))

(declare-fun m!847895 () Bool)

(assert (=> b!912882 m!847895))

(declare-fun m!847897 () Bool)

(assert (=> start!78308 m!847897))

(declare-fun m!847899 () Bool)

(assert (=> start!78308 m!847899))

(declare-fun m!847901 () Bool)

(assert (=> start!78308 m!847901))

(declare-fun m!847903 () Bool)

(assert (=> mapNonEmpty!30328 m!847903))

(declare-fun m!847905 () Bool)

(assert (=> b!912886 m!847905))

(assert (=> b!912886 m!847905))

(declare-fun m!847907 () Bool)

(assert (=> b!912886 m!847907))

(check-sat (not b!912882) (not start!78308) tp_is_empty!19069 (not b!912886) (not b_next!16651) (not mapNonEmpty!30328) (not b!912881) b_and!27235)
(check-sat b_and!27235 (not b_next!16651))

; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78192 () Bool)

(assert start!78192)

(declare-fun b_free!16683 () Bool)

(declare-fun b_next!16683 () Bool)

(assert (=> start!78192 (= b_free!16683 (not b_next!16683))))

(declare-fun tp!58326 () Bool)

(declare-fun b_and!27259 () Bool)

(assert (=> start!78192 (= tp!58326 b_and!27259)))

(declare-fun b!912503 () Bool)

(declare-fun res!615547 () Bool)

(declare-fun e!511863 () Bool)

(assert (=> b!912503 (=> (not res!615547) (not e!511863))))

(declare-fun i!717 () (_ BitVec 32))

(declare-datatypes ((array!54196 0))(
  ( (array!54197 (arr!26052 (Array (_ BitVec 32) (_ BitVec 64))) (size!26511 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54196)

(declare-fun k0!1033 () (_ BitVec 64))

(assert (=> b!912503 (= res!615547 (and (= (select (arr!26052 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!912504 () Bool)

(declare-fun e!511859 () Bool)

(declare-fun tp_is_empty!19101 () Bool)

(assert (=> b!912504 (= e!511859 tp_is_empty!19101)))

(declare-fun b!912505 () Bool)

(declare-fun e!511862 () Bool)

(assert (=> b!912505 (= e!511862 tp_is_empty!19101)))

(declare-fun b!912506 () Bool)

(declare-fun e!511860 () Bool)

(declare-fun mapRes!30379 () Bool)

(assert (=> b!912506 (= e!511860 (and e!511862 mapRes!30379))))

(declare-fun condMapEmpty!30379 () Bool)

(declare-datatypes ((V!30433 0))(
  ( (V!30434 (val!9601 Int)) )
))
(declare-datatypes ((ValueCell!9069 0))(
  ( (ValueCellFull!9069 (v!12112 V!30433)) (EmptyCell!9069) )
))
(declare-datatypes ((array!54198 0))(
  ( (array!54199 (arr!26053 (Array (_ BitVec 32) ValueCell!9069)) (size!26512 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54198)

(declare-fun mapDefault!30379 () ValueCell!9069)

(assert (=> b!912506 (= condMapEmpty!30379 (= (arr!26053 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!9069)) mapDefault!30379)))))

(declare-fun b!912507 () Bool)

(assert (=> b!912507 (= e!511863 (not true))))

(declare-fun arrayContainsKey!0 (array!54196 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!912507 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!30433)

(declare-datatypes ((Unit!30876 0))(
  ( (Unit!30877) )
))
(declare-fun lt!410675 () Unit!30876)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30433)

(declare-fun lemmaKeyInListMapIsInArray!263 (array!54196 array!54198 (_ BitVec 32) (_ BitVec 32) V!30433 V!30433 (_ BitVec 64) Int) Unit!30876)

(assert (=> b!912507 (= lt!410675 (lemmaKeyInListMapIsInArray!263 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun b!912508 () Bool)

(declare-fun res!615545 () Bool)

(assert (=> b!912508 (=> (not res!615545) (not e!511863))))

(declare-datatypes ((List!18298 0))(
  ( (Nil!18295) (Cons!18294 (h!19440 (_ BitVec 64)) (t!25887 List!18298)) )
))
(declare-fun arrayNoDuplicates!0 (array!54196 (_ BitVec 32) List!18298) Bool)

(assert (=> b!912508 (= res!615545 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18295))))

(declare-fun b!912509 () Bool)

(declare-fun res!615544 () Bool)

(assert (=> b!912509 (=> (not res!615544) (not e!511863))))

(declare-datatypes ((tuple2!12508 0))(
  ( (tuple2!12509 (_1!6265 (_ BitVec 64)) (_2!6265 V!30433)) )
))
(declare-datatypes ((List!18299 0))(
  ( (Nil!18296) (Cons!18295 (h!19441 tuple2!12508) (t!25888 List!18299)) )
))
(declare-datatypes ((ListLongMap!11205 0))(
  ( (ListLongMap!11206 (toList!5618 List!18299)) )
))
(declare-fun contains!4664 (ListLongMap!11205 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2880 (array!54196 array!54198 (_ BitVec 32) (_ BitVec 32) V!30433 V!30433 (_ BitVec 32) Int) ListLongMap!11205)

(assert (=> b!912509 (= res!615544 (contains!4664 (getCurrentListMap!2880 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!912510 () Bool)

(declare-fun res!615543 () Bool)

(assert (=> b!912510 (=> (not res!615543) (not e!511863))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54196 (_ BitVec 32)) Bool)

(assert (=> b!912510 (= res!615543 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!912511 () Bool)

(declare-fun res!615548 () Bool)

(assert (=> b!912511 (=> (not res!615548) (not e!511863))))

(assert (=> b!912511 (= res!615548 (and (= (size!26512 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26511 _keys!1386) (size!26512 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun res!615546 () Bool)

(assert (=> start!78192 (=> (not res!615546) (not e!511863))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78192 (= res!615546 (validMask!0 mask!1756))))

(assert (=> start!78192 e!511863))

(declare-fun array_inv!20354 (array!54198) Bool)

(assert (=> start!78192 (and (array_inv!20354 _values!1152) e!511860)))

(assert (=> start!78192 tp!58326))

(assert (=> start!78192 true))

(assert (=> start!78192 tp_is_empty!19101))

(declare-fun array_inv!20355 (array!54196) Bool)

(assert (=> start!78192 (array_inv!20355 _keys!1386)))

(declare-fun mapNonEmpty!30379 () Bool)

(declare-fun tp!58325 () Bool)

(assert (=> mapNonEmpty!30379 (= mapRes!30379 (and tp!58325 e!511859))))

(declare-fun mapRest!30379 () (Array (_ BitVec 32) ValueCell!9069))

(declare-fun mapValue!30379 () ValueCell!9069)

(declare-fun mapKey!30379 () (_ BitVec 32))

(assert (=> mapNonEmpty!30379 (= (arr!26053 _values!1152) (store mapRest!30379 mapKey!30379 mapValue!30379))))

(declare-fun mapIsEmpty!30379 () Bool)

(assert (=> mapIsEmpty!30379 mapRes!30379))

(declare-fun b!912512 () Bool)

(declare-fun res!615549 () Bool)

(assert (=> b!912512 (=> (not res!615549) (not e!511863))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!912512 (= res!615549 (inRange!0 i!717 mask!1756))))

(assert (= (and start!78192 res!615546) b!912511))

(assert (= (and b!912511 res!615548) b!912510))

(assert (= (and b!912510 res!615543) b!912508))

(assert (= (and b!912508 res!615545) b!912509))

(assert (= (and b!912509 res!615544) b!912512))

(assert (= (and b!912512 res!615549) b!912503))

(assert (= (and b!912503 res!615547) b!912507))

(assert (= (and b!912506 condMapEmpty!30379) mapIsEmpty!30379))

(assert (= (and b!912506 (not condMapEmpty!30379)) mapNonEmpty!30379))

(get-info :version)

(assert (= (and mapNonEmpty!30379 ((_ is ValueCellFull!9069) mapValue!30379)) b!912504))

(assert (= (and b!912506 ((_ is ValueCellFull!9069) mapDefault!30379)) b!912505))

(assert (= start!78192 b!912506))

(declare-fun m!846995 () Bool)

(assert (=> start!78192 m!846995))

(declare-fun m!846997 () Bool)

(assert (=> start!78192 m!846997))

(declare-fun m!846999 () Bool)

(assert (=> start!78192 m!846999))

(declare-fun m!847001 () Bool)

(assert (=> b!912510 m!847001))

(declare-fun m!847003 () Bool)

(assert (=> b!912507 m!847003))

(declare-fun m!847005 () Bool)

(assert (=> b!912507 m!847005))

(declare-fun m!847007 () Bool)

(assert (=> mapNonEmpty!30379 m!847007))

(declare-fun m!847009 () Bool)

(assert (=> b!912508 m!847009))

(declare-fun m!847011 () Bool)

(assert (=> b!912509 m!847011))

(assert (=> b!912509 m!847011))

(declare-fun m!847013 () Bool)

(assert (=> b!912509 m!847013))

(declare-fun m!847015 () Bool)

(assert (=> b!912512 m!847015))

(declare-fun m!847017 () Bool)

(assert (=> b!912503 m!847017))

(check-sat (not b_next!16683) (not b!912507) (not b!912508) (not b!912509) (not b!912510) (not b!912512) tp_is_empty!19101 b_and!27259 (not mapNonEmpty!30379) (not start!78192))
(check-sat b_and!27259 (not b_next!16683))

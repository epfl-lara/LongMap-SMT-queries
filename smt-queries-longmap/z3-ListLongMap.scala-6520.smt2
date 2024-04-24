; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83128 () Bool)

(assert start!83128)

(declare-fun b_free!19087 () Bool)

(declare-fun b_next!19087 () Bool)

(assert (=> start!83128 (= b_free!19087 (not b_next!19087))))

(declare-fun tp!66391 () Bool)

(declare-fun b_and!30585 () Bool)

(assert (=> start!83128 (= tp!66391 b_and!30585)))

(declare-fun b!969195 () Bool)

(declare-fun res!648582 () Bool)

(declare-fun e!546264 () Bool)

(assert (=> b!969195 (=> (not res!648582) (not e!546264))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!34177 0))(
  ( (V!34178 (val!10998 Int)) )
))
(declare-datatypes ((ValueCell!10466 0))(
  ( (ValueCellFull!10466 (v!13553 V!34177)) (EmptyCell!10466) )
))
(declare-datatypes ((array!59878 0))(
  ( (array!59879 (arr!28803 (Array (_ BitVec 32) ValueCell!10466)) (size!29283 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59878)

(declare-datatypes ((array!59880 0))(
  ( (array!59881 (arr!28804 (Array (_ BitVec 32) (_ BitVec 64))) (size!29284 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59880)

(declare-fun mask!2110 () (_ BitVec 32))

(assert (=> b!969195 (= res!648582 (and (= (size!29283 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29284 _keys!1686) (size!29283 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!969196 () Bool)

(declare-fun res!648581 () Bool)

(assert (=> b!969196 (=> (not res!648581) (not e!546264))))

(declare-datatypes ((List!19986 0))(
  ( (Nil!19983) (Cons!19982 (h!21150 (_ BitVec 64)) (t!28341 List!19986)) )
))
(declare-fun arrayNoDuplicates!0 (array!59880 (_ BitVec 32) List!19986) Bool)

(assert (=> b!969196 (= res!648581 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19983))))

(declare-fun res!648588 () Bool)

(assert (=> start!83128 (=> (not res!648588) (not e!546264))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83128 (= res!648588 (validMask!0 mask!2110))))

(assert (=> start!83128 e!546264))

(assert (=> start!83128 true))

(declare-fun e!546266 () Bool)

(declare-fun array_inv!22359 (array!59878) Bool)

(assert (=> start!83128 (and (array_inv!22359 _values!1400) e!546266)))

(declare-fun array_inv!22360 (array!59880) Bool)

(assert (=> start!83128 (array_inv!22360 _keys!1686)))

(assert (=> start!83128 tp!66391))

(declare-fun tp_is_empty!21895 () Bool)

(assert (=> start!83128 tp_is_empty!21895))

(declare-fun b!969197 () Bool)

(declare-fun e!546265 () Bool)

(assert (=> b!969197 (= e!546265 tp_is_empty!21895)))

(declare-fun b!969198 () Bool)

(declare-fun mapRes!34837 () Bool)

(assert (=> b!969198 (= e!546266 (and e!546265 mapRes!34837))))

(declare-fun condMapEmpty!34837 () Bool)

(declare-fun mapDefault!34837 () ValueCell!10466)

(assert (=> b!969198 (= condMapEmpty!34837 (= (arr!28803 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10466)) mapDefault!34837)))))

(declare-fun b!969199 () Bool)

(declare-fun res!648585 () Bool)

(assert (=> b!969199 (=> (not res!648585) (not e!546264))))

(declare-fun minValue!1342 () V!34177)

(declare-fun defaultEntry!1403 () Int)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun zeroValue!1342 () V!34177)

(declare-fun from!2084 () (_ BitVec 32))

(declare-datatypes ((tuple2!14144 0))(
  ( (tuple2!14145 (_1!7083 (_ BitVec 64)) (_2!7083 V!34177)) )
))
(declare-datatypes ((List!19987 0))(
  ( (Nil!19984) (Cons!19983 (h!21151 tuple2!14144) (t!28342 List!19987)) )
))
(declare-datatypes ((ListLongMap!12843 0))(
  ( (ListLongMap!12844 (toList!6437 List!19987)) )
))
(declare-fun contains!5549 (ListLongMap!12843 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3670 (array!59880 array!59878 (_ BitVec 32) (_ BitVec 32) V!34177 V!34177 (_ BitVec 32) Int) ListLongMap!12843)

(assert (=> b!969199 (= res!648585 (contains!5549 (getCurrentListMap!3670 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28804 _keys!1686) i!803)))))

(declare-fun b!969200 () Bool)

(declare-fun res!648587 () Bool)

(assert (=> b!969200 (=> (not res!648587) (not e!546264))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!969200 (= res!648587 (validKeyInArray!0 (select (arr!28804 _keys!1686) i!803)))))

(declare-fun b!969201 () Bool)

(declare-fun e!546262 () Bool)

(assert (=> b!969201 (= e!546262 tp_is_empty!21895)))

(declare-fun b!969202 () Bool)

(assert (=> b!969202 (= e!546264 (bvslt i!803 #b00000000000000000000000000000000))))

(declare-fun lt!431876 () ListLongMap!12843)

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!969202 (= lt!431876 (getCurrentListMap!3670 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 newFrom!159 defaultEntry!1403))))

(declare-fun b!969203 () Bool)

(declare-fun res!648586 () Bool)

(assert (=> b!969203 (=> (not res!648586) (not e!546264))))

(assert (=> b!969203 (= res!648586 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29284 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29284 _keys!1686))))))

(declare-fun b!969204 () Bool)

(declare-fun res!648584 () Bool)

(assert (=> b!969204 (=> (not res!648584) (not e!546264))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59880 (_ BitVec 32)) Bool)

(assert (=> b!969204 (= res!648584 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun mapNonEmpty!34837 () Bool)

(declare-fun tp!66390 () Bool)

(assert (=> mapNonEmpty!34837 (= mapRes!34837 (and tp!66390 e!546262))))

(declare-fun mapValue!34837 () ValueCell!10466)

(declare-fun mapRest!34837 () (Array (_ BitVec 32) ValueCell!10466))

(declare-fun mapKey!34837 () (_ BitVec 32))

(assert (=> mapNonEmpty!34837 (= (arr!28803 _values!1400) (store mapRest!34837 mapKey!34837 mapValue!34837))))

(declare-fun b!969205 () Bool)

(declare-fun res!648583 () Bool)

(assert (=> b!969205 (=> (not res!648583) (not e!546264))))

(assert (=> b!969205 (= res!648583 (bvsle from!2084 newFrom!159))))

(declare-fun mapIsEmpty!34837 () Bool)

(assert (=> mapIsEmpty!34837 mapRes!34837))

(assert (= (and start!83128 res!648588) b!969195))

(assert (= (and b!969195 res!648582) b!969204))

(assert (= (and b!969204 res!648584) b!969196))

(assert (= (and b!969196 res!648581) b!969203))

(assert (= (and b!969203 res!648586) b!969200))

(assert (= (and b!969200 res!648587) b!969199))

(assert (= (and b!969199 res!648585) b!969205))

(assert (= (and b!969205 res!648583) b!969202))

(assert (= (and b!969198 condMapEmpty!34837) mapIsEmpty!34837))

(assert (= (and b!969198 (not condMapEmpty!34837)) mapNonEmpty!34837))

(get-info :version)

(assert (= (and mapNonEmpty!34837 ((_ is ValueCellFull!10466) mapValue!34837)) b!969201))

(assert (= (and b!969198 ((_ is ValueCellFull!10466) mapDefault!34837)) b!969197))

(assert (= start!83128 b!969198))

(declare-fun m!897979 () Bool)

(assert (=> b!969202 m!897979))

(declare-fun m!897981 () Bool)

(assert (=> b!969199 m!897981))

(declare-fun m!897983 () Bool)

(assert (=> b!969199 m!897983))

(assert (=> b!969199 m!897981))

(assert (=> b!969199 m!897983))

(declare-fun m!897985 () Bool)

(assert (=> b!969199 m!897985))

(declare-fun m!897987 () Bool)

(assert (=> b!969204 m!897987))

(assert (=> b!969200 m!897983))

(assert (=> b!969200 m!897983))

(declare-fun m!897989 () Bool)

(assert (=> b!969200 m!897989))

(declare-fun m!897991 () Bool)

(assert (=> start!83128 m!897991))

(declare-fun m!897993 () Bool)

(assert (=> start!83128 m!897993))

(declare-fun m!897995 () Bool)

(assert (=> start!83128 m!897995))

(declare-fun m!897997 () Bool)

(assert (=> b!969196 m!897997))

(declare-fun m!897999 () Bool)

(assert (=> mapNonEmpty!34837 m!897999))

(check-sat (not b!969196) (not start!83128) (not mapNonEmpty!34837) b_and!30585 tp_is_empty!21895 (not b!969202) (not b_next!19087) (not b!969204) (not b!969200) (not b!969199))
(check-sat b_and!30585 (not b_next!19087))

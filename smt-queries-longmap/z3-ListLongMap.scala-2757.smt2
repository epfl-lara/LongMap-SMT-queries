; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40396 () Bool)

(assert start!40396)

(declare-fun b!444068 () Bool)

(declare-fun res!263256 () Bool)

(declare-fun e!261201 () Bool)

(assert (=> b!444068 (=> (not res!263256) (not e!261201))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!444068 (= res!263256 (validKeyInArray!0 k0!794))))

(declare-fun mapIsEmpty!19299 () Bool)

(declare-fun mapRes!19299 () Bool)

(assert (=> mapIsEmpty!19299 mapRes!19299))

(declare-fun b!444069 () Bool)

(declare-fun res!263260 () Bool)

(assert (=> b!444069 (=> (not res!263260) (not e!261201))))

(declare-datatypes ((array!27371 0))(
  ( (array!27372 (arr!13133 (Array (_ BitVec 32) (_ BitVec 64))) (size!13485 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27371)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27371 (_ BitVec 32)) Bool)

(assert (=> b!444069 (= res!263260 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!444070 () Bool)

(declare-fun e!261204 () Bool)

(declare-fun e!261202 () Bool)

(assert (=> b!444070 (= e!261204 (and e!261202 mapRes!19299))))

(declare-fun condMapEmpty!19299 () Bool)

(declare-datatypes ((V!16813 0))(
  ( (V!16814 (val!5935 Int)) )
))
(declare-datatypes ((ValueCell!5547 0))(
  ( (ValueCellFull!5547 (v!8186 V!16813)) (EmptyCell!5547) )
))
(declare-datatypes ((array!27373 0))(
  ( (array!27374 (arr!13134 (Array (_ BitVec 32) ValueCell!5547)) (size!13486 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27373)

(declare-fun mapDefault!19299 () ValueCell!5547)

(assert (=> b!444070 (= condMapEmpty!19299 (= (arr!13134 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5547)) mapDefault!19299)))))

(declare-fun b!444071 () Bool)

(declare-fun res!263258 () Bool)

(assert (=> b!444071 (=> (not res!263258) (not e!261201))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!444071 (= res!263258 (or (= (select (arr!13133 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13133 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!444072 () Bool)

(declare-fun tp_is_empty!11781 () Bool)

(assert (=> b!444072 (= e!261202 tp_is_empty!11781)))

(declare-fun b!444073 () Bool)

(declare-fun res!263252 () Bool)

(assert (=> b!444073 (=> (not res!263252) (not e!261201))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!444073 (= res!263252 (validMask!0 mask!1025))))

(declare-fun b!444074 () Bool)

(declare-fun e!261205 () Bool)

(assert (=> b!444074 (= e!261205 tp_is_empty!11781)))

(declare-fun res!263259 () Bool)

(assert (=> start!40396 (=> (not res!263259) (not e!261201))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40396 (= res!263259 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13485 _keys!709))))))

(assert (=> start!40396 e!261201))

(assert (=> start!40396 true))

(declare-fun array_inv!9528 (array!27373) Bool)

(assert (=> start!40396 (and (array_inv!9528 _values!549) e!261204)))

(declare-fun array_inv!9529 (array!27371) Bool)

(assert (=> start!40396 (array_inv!9529 _keys!709)))

(declare-fun b!444075 () Bool)

(declare-fun res!263257 () Bool)

(assert (=> b!444075 (=> (not res!263257) (not e!261201))))

(assert (=> b!444075 (= res!263257 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13485 _keys!709))))))

(declare-fun b!444076 () Bool)

(declare-fun res!263255 () Bool)

(assert (=> b!444076 (=> (not res!263255) (not e!261201))))

(declare-fun arrayContainsKey!0 (array!27371 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!444076 (= res!263255 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!444077 () Bool)

(declare-fun e!261203 () Bool)

(assert (=> b!444077 (= e!261203 false)))

(declare-fun lt!203435 () Bool)

(declare-fun lt!203434 () array!27371)

(declare-datatypes ((List!7867 0))(
  ( (Nil!7864) (Cons!7863 (h!8719 (_ BitVec 64)) (t!13625 List!7867)) )
))
(declare-fun arrayNoDuplicates!0 (array!27371 (_ BitVec 32) List!7867) Bool)

(assert (=> b!444077 (= lt!203435 (arrayNoDuplicates!0 lt!203434 #b00000000000000000000000000000000 Nil!7864))))

(declare-fun mapNonEmpty!19299 () Bool)

(declare-fun tp!37281 () Bool)

(assert (=> mapNonEmpty!19299 (= mapRes!19299 (and tp!37281 e!261205))))

(declare-fun mapKey!19299 () (_ BitVec 32))

(declare-fun mapRest!19299 () (Array (_ BitVec 32) ValueCell!5547))

(declare-fun mapValue!19299 () ValueCell!5547)

(assert (=> mapNonEmpty!19299 (= (arr!13134 _values!549) (store mapRest!19299 mapKey!19299 mapValue!19299))))

(declare-fun b!444078 () Bool)

(declare-fun res!263253 () Bool)

(assert (=> b!444078 (=> (not res!263253) (not e!261201))))

(assert (=> b!444078 (= res!263253 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7864))))

(declare-fun b!444079 () Bool)

(declare-fun res!263251 () Bool)

(assert (=> b!444079 (=> (not res!263251) (not e!261201))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!444079 (= res!263251 (and (= (size!13486 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13485 _keys!709) (size!13486 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!444080 () Bool)

(assert (=> b!444080 (= e!261201 e!261203)))

(declare-fun res!263254 () Bool)

(assert (=> b!444080 (=> (not res!263254) (not e!261203))))

(assert (=> b!444080 (= res!263254 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203434 mask!1025))))

(assert (=> b!444080 (= lt!203434 (array!27372 (store (arr!13133 _keys!709) i!563 k0!794) (size!13485 _keys!709)))))

(assert (= (and start!40396 res!263259) b!444073))

(assert (= (and b!444073 res!263252) b!444079))

(assert (= (and b!444079 res!263251) b!444069))

(assert (= (and b!444069 res!263260) b!444078))

(assert (= (and b!444078 res!263253) b!444075))

(assert (= (and b!444075 res!263257) b!444068))

(assert (= (and b!444068 res!263256) b!444071))

(assert (= (and b!444071 res!263258) b!444076))

(assert (= (and b!444076 res!263255) b!444080))

(assert (= (and b!444080 res!263254) b!444077))

(assert (= (and b!444070 condMapEmpty!19299) mapIsEmpty!19299))

(assert (= (and b!444070 (not condMapEmpty!19299)) mapNonEmpty!19299))

(get-info :version)

(assert (= (and mapNonEmpty!19299 ((_ is ValueCellFull!5547) mapValue!19299)) b!444074))

(assert (= (and b!444070 ((_ is ValueCellFull!5547) mapDefault!19299)) b!444072))

(assert (= start!40396 b!444070))

(declare-fun m!430093 () Bool)

(assert (=> start!40396 m!430093))

(declare-fun m!430095 () Bool)

(assert (=> start!40396 m!430095))

(declare-fun m!430097 () Bool)

(assert (=> b!444076 m!430097))

(declare-fun m!430099 () Bool)

(assert (=> b!444071 m!430099))

(declare-fun m!430101 () Bool)

(assert (=> b!444078 m!430101))

(declare-fun m!430103 () Bool)

(assert (=> b!444080 m!430103))

(declare-fun m!430105 () Bool)

(assert (=> b!444080 m!430105))

(declare-fun m!430107 () Bool)

(assert (=> b!444073 m!430107))

(declare-fun m!430109 () Bool)

(assert (=> b!444068 m!430109))

(declare-fun m!430111 () Bool)

(assert (=> mapNonEmpty!19299 m!430111))

(declare-fun m!430113 () Bool)

(assert (=> b!444069 m!430113))

(declare-fun m!430115 () Bool)

(assert (=> b!444077 m!430115))

(check-sat (not b!444078) (not start!40396) (not b!444069) (not b!444080) (not b!444077) (not b!444068) (not b!444076) tp_is_empty!11781 (not b!444073) (not mapNonEmpty!19299))
(check-sat)

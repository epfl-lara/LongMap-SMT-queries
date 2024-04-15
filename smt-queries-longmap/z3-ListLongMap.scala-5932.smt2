; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77346 () Bool)

(assert start!77346)

(declare-datatypes ((V!29527 0))(
  ( (V!29528 (val!9261 Int)) )
))
(declare-datatypes ((ValueCell!8729 0))(
  ( (ValueCellFull!8729 (v!11764 V!29527)) (EmptyCell!8729) )
))
(declare-datatypes ((array!52887 0))(
  ( (array!52888 (arr!25409 (Array (_ BitVec 32) ValueCell!8729)) (size!25870 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!52887)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-datatypes ((array!52889 0))(
  ( (array!52890 (arr!25410 (Array (_ BitVec 32) (_ BitVec 64))) (size!25871 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!52889)

(declare-fun b!901903 () Bool)

(declare-fun e!505004 () Bool)

(assert (=> b!901903 (= e!505004 (and (= (size!25870 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!25871 _keys!1386) (size!25870 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011) (not (= (size!25871 _keys!1386) (bvadd #b00000000000000000000000000000001 mask!1756)))))))

(declare-fun b!901904 () Bool)

(declare-fun e!505005 () Bool)

(declare-fun e!505002 () Bool)

(declare-fun mapRes!29326 () Bool)

(assert (=> b!901904 (= e!505005 (and e!505002 mapRes!29326))))

(declare-fun condMapEmpty!29326 () Bool)

(declare-fun mapDefault!29326 () ValueCell!8729)

(assert (=> b!901904 (= condMapEmpty!29326 (= (arr!25409 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8729)) mapDefault!29326)))))

(declare-fun b!901905 () Bool)

(declare-fun tp_is_empty!18421 () Bool)

(assert (=> b!901905 (= e!505002 tp_is_empty!18421)))

(declare-fun mapNonEmpty!29326 () Bool)

(declare-fun tp!56386 () Bool)

(declare-fun e!505003 () Bool)

(assert (=> mapNonEmpty!29326 (= mapRes!29326 (and tp!56386 e!505003))))

(declare-fun mapValue!29326 () ValueCell!8729)

(declare-fun mapKey!29326 () (_ BitVec 32))

(declare-fun mapRest!29326 () (Array (_ BitVec 32) ValueCell!8729))

(assert (=> mapNonEmpty!29326 (= (arr!25409 _values!1152) (store mapRest!29326 mapKey!29326 mapValue!29326))))

(declare-fun res!608764 () Bool)

(assert (=> start!77346 (=> (not res!608764) (not e!505004))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77346 (= res!608764 (validMask!0 mask!1756))))

(assert (=> start!77346 e!505004))

(assert (=> start!77346 true))

(declare-fun array_inv!19982 (array!52887) Bool)

(assert (=> start!77346 (and (array_inv!19982 _values!1152) e!505005)))

(declare-fun array_inv!19983 (array!52889) Bool)

(assert (=> start!77346 (array_inv!19983 _keys!1386)))

(declare-fun b!901906 () Bool)

(assert (=> b!901906 (= e!505003 tp_is_empty!18421)))

(declare-fun mapIsEmpty!29326 () Bool)

(assert (=> mapIsEmpty!29326 mapRes!29326))

(assert (= (and start!77346 res!608764) b!901903))

(assert (= (and b!901904 condMapEmpty!29326) mapIsEmpty!29326))

(assert (= (and b!901904 (not condMapEmpty!29326)) mapNonEmpty!29326))

(get-info :version)

(assert (= (and mapNonEmpty!29326 ((_ is ValueCellFull!8729) mapValue!29326)) b!901906))

(assert (= (and b!901904 ((_ is ValueCellFull!8729) mapDefault!29326)) b!901905))

(assert (= start!77346 b!901904))

(declare-fun m!837505 () Bool)

(assert (=> mapNonEmpty!29326 m!837505))

(declare-fun m!837507 () Bool)

(assert (=> start!77346 m!837507))

(declare-fun m!837509 () Bool)

(assert (=> start!77346 m!837509))

(declare-fun m!837511 () Bool)

(assert (=> start!77346 m!837511))

(check-sat (not start!77346) (not mapNonEmpty!29326) tp_is_empty!18421)
(check-sat)

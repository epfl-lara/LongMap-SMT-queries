; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43216 () Bool)

(assert start!43216)

(declare-fun b!478930 () Bool)

(declare-fun res!285714 () Bool)

(declare-fun e!281685 () Bool)

(assert (=> b!478930 (=> (not res!285714) (not e!281685))))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-datatypes ((array!30887 0))(
  ( (array!30888 (arr!14851 (Array (_ BitVec 32) (_ BitVec 64))) (size!15209 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!30887)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-datatypes ((V!19211 0))(
  ( (V!19212 (val!6850 Int)) )
))
(declare-datatypes ((ValueCell!6441 0))(
  ( (ValueCellFull!6441 (v!9139 V!19211)) (EmptyCell!6441) )
))
(declare-datatypes ((array!30889 0))(
  ( (array!30890 (arr!14852 (Array (_ BitVec 32) ValueCell!6441)) (size!15210 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!30889)

(assert (=> b!478930 (= res!285714 (and (= (size!15210 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15209 _keys!1874) (size!15210 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun b!478931 () Bool)

(declare-fun e!281687 () Bool)

(declare-fun e!281688 () Bool)

(declare-fun mapRes!22102 () Bool)

(assert (=> b!478931 (= e!281687 (and e!281688 mapRes!22102))))

(declare-fun condMapEmpty!22102 () Bool)

(declare-fun mapDefault!22102 () ValueCell!6441)

(assert (=> b!478931 (= condMapEmpty!22102 (= (arr!14852 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6441)) mapDefault!22102)))))

(declare-fun mapNonEmpty!22102 () Bool)

(declare-fun tp!42577 () Bool)

(declare-fun e!281686 () Bool)

(assert (=> mapNonEmpty!22102 (= mapRes!22102 (and tp!42577 e!281686))))

(declare-fun mapValue!22102 () ValueCell!6441)

(declare-fun mapKey!22102 () (_ BitVec 32))

(declare-fun mapRest!22102 () (Array (_ BitVec 32) ValueCell!6441))

(assert (=> mapNonEmpty!22102 (= (arr!14852 _values!1516) (store mapRest!22102 mapKey!22102 mapValue!22102))))

(declare-fun b!478932 () Bool)

(declare-fun tp_is_empty!13605 () Bool)

(assert (=> b!478932 (= e!281686 tp_is_empty!13605)))

(declare-fun res!285712 () Bool)

(assert (=> start!43216 (=> (not res!285712) (not e!281685))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43216 (= res!285712 (validMask!0 mask!2352))))

(assert (=> start!43216 e!281685))

(assert (=> start!43216 true))

(declare-fun array_inv!10716 (array!30889) Bool)

(assert (=> start!43216 (and (array_inv!10716 _values!1516) e!281687)))

(declare-fun array_inv!10717 (array!30887) Bool)

(assert (=> start!43216 (array_inv!10717 _keys!1874)))

(declare-fun b!478933 () Bool)

(assert (=> b!478933 (= e!281685 false)))

(declare-fun lt!217792 () Bool)

(declare-datatypes ((List!9076 0))(
  ( (Nil!9073) (Cons!9072 (h!9928 (_ BitVec 64)) (t!15282 List!9076)) )
))
(declare-fun arrayNoDuplicates!0 (array!30887 (_ BitVec 32) List!9076) Bool)

(assert (=> b!478933 (= lt!217792 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9073))))

(declare-fun b!478934 () Bool)

(assert (=> b!478934 (= e!281688 tp_is_empty!13605)))

(declare-fun b!478935 () Bool)

(declare-fun res!285713 () Bool)

(assert (=> b!478935 (=> (not res!285713) (not e!281685))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30887 (_ BitVec 32)) Bool)

(assert (=> b!478935 (= res!285713 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun mapIsEmpty!22102 () Bool)

(assert (=> mapIsEmpty!22102 mapRes!22102))

(assert (= (and start!43216 res!285712) b!478930))

(assert (= (and b!478930 res!285714) b!478935))

(assert (= (and b!478935 res!285713) b!478933))

(assert (= (and b!478931 condMapEmpty!22102) mapIsEmpty!22102))

(assert (= (and b!478931 (not condMapEmpty!22102)) mapNonEmpty!22102))

(get-info :version)

(assert (= (and mapNonEmpty!22102 ((_ is ValueCellFull!6441) mapValue!22102)) b!478932))

(assert (= (and b!478931 ((_ is ValueCellFull!6441) mapDefault!22102)) b!478934))

(assert (= start!43216 b!478931))

(declare-fun m!461033 () Bool)

(assert (=> mapNonEmpty!22102 m!461033))

(declare-fun m!461035 () Bool)

(assert (=> start!43216 m!461035))

(declare-fun m!461037 () Bool)

(assert (=> start!43216 m!461037))

(declare-fun m!461039 () Bool)

(assert (=> start!43216 m!461039))

(declare-fun m!461041 () Bool)

(assert (=> b!478933 m!461041))

(declare-fun m!461043 () Bool)

(assert (=> b!478935 m!461043))

(check-sat (not b!478935) (not mapNonEmpty!22102) (not b!478933) tp_is_empty!13605 (not start!43216))
(check-sat)

; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20776 () Bool)

(assert start!20776)

(declare-fun b!207921 () Bool)

(declare-fun e!135646 () Bool)

(declare-fun e!135644 () Bool)

(declare-fun mapRes!8999 () Bool)

(assert (=> b!207921 (= e!135646 (and e!135644 mapRes!8999))))

(declare-fun condMapEmpty!8999 () Bool)

(declare-datatypes ((V!6697 0))(
  ( (V!6698 (val!2688 Int)) )
))
(declare-datatypes ((ValueCell!2300 0))(
  ( (ValueCellFull!2300 (v!4652 V!6697)) (EmptyCell!2300) )
))
(declare-datatypes ((array!9765 0))(
  ( (array!9766 (arr!4632 (Array (_ BitVec 32) ValueCell!2300)) (size!4958 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9765)

(declare-fun mapDefault!8999 () ValueCell!2300)

(assert (=> b!207921 (= condMapEmpty!8999 (= (arr!4632 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2300)) mapDefault!8999)))))

(declare-fun mapNonEmpty!8999 () Bool)

(declare-fun tp!19322 () Bool)

(declare-fun e!135647 () Bool)

(assert (=> mapNonEmpty!8999 (= mapRes!8999 (and tp!19322 e!135647))))

(declare-fun mapRest!8999 () (Array (_ BitVec 32) ValueCell!2300))

(declare-fun mapKey!8999 () (_ BitVec 32))

(declare-fun mapValue!8999 () ValueCell!2300)

(assert (=> mapNonEmpty!8999 (= (arr!4632 _values!649) (store mapRest!8999 mapKey!8999 mapValue!8999))))

(declare-fun res!101050 () Bool)

(declare-fun e!135648 () Bool)

(assert (=> start!20776 (=> (not res!101050) (not e!135648))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20776 (= res!101050 (validMask!0 mask!1149))))

(assert (=> start!20776 e!135648))

(assert (=> start!20776 true))

(declare-fun array_inv!3045 (array!9765) Bool)

(assert (=> start!20776 (and (array_inv!3045 _values!649) e!135646)))

(declare-datatypes ((array!9767 0))(
  ( (array!9768 (arr!4633 (Array (_ BitVec 32) (_ BitVec 64))) (size!4959 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9767)

(declare-fun array_inv!3046 (array!9767) Bool)

(assert (=> start!20776 (array_inv!3046 _keys!825)))

(declare-fun b!207922 () Bool)

(declare-fun tp_is_empty!5287 () Bool)

(assert (=> b!207922 (= e!135644 tp_is_empty!5287)))

(declare-fun b!207923 () Bool)

(assert (=> b!207923 (= e!135647 tp_is_empty!5287)))

(declare-fun b!207924 () Bool)

(assert (=> b!207924 (= e!135648 false)))

(declare-fun lt!106541 () Bool)

(declare-datatypes ((List!2964 0))(
  ( (Nil!2961) (Cons!2960 (h!3602 (_ BitVec 64)) (t!7886 List!2964)) )
))
(declare-fun arrayNoDuplicates!0 (array!9767 (_ BitVec 32) List!2964) Bool)

(assert (=> b!207924 (= lt!106541 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2961))))

(declare-fun b!207925 () Bool)

(declare-fun res!101049 () Bool)

(assert (=> b!207925 (=> (not res!101049) (not e!135648))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!207925 (= res!101049 (and (= (size!4958 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4959 _keys!825) (size!4958 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!207926 () Bool)

(declare-fun res!101051 () Bool)

(assert (=> b!207926 (=> (not res!101051) (not e!135648))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9767 (_ BitVec 32)) Bool)

(assert (=> b!207926 (= res!101051 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun mapIsEmpty!8999 () Bool)

(assert (=> mapIsEmpty!8999 mapRes!8999))

(assert (= (and start!20776 res!101050) b!207925))

(assert (= (and b!207925 res!101049) b!207926))

(assert (= (and b!207926 res!101051) b!207924))

(assert (= (and b!207921 condMapEmpty!8999) mapIsEmpty!8999))

(assert (= (and b!207921 (not condMapEmpty!8999)) mapNonEmpty!8999))

(get-info :version)

(assert (= (and mapNonEmpty!8999 ((_ is ValueCellFull!2300) mapValue!8999)) b!207923))

(assert (= (and b!207921 ((_ is ValueCellFull!2300) mapDefault!8999)) b!207922))

(assert (= start!20776 b!207921))

(declare-fun m!235203 () Bool)

(assert (=> mapNonEmpty!8999 m!235203))

(declare-fun m!235205 () Bool)

(assert (=> start!20776 m!235205))

(declare-fun m!235207 () Bool)

(assert (=> start!20776 m!235207))

(declare-fun m!235209 () Bool)

(assert (=> start!20776 m!235209))

(declare-fun m!235211 () Bool)

(assert (=> b!207924 m!235211))

(declare-fun m!235213 () Bool)

(assert (=> b!207926 m!235213))

(check-sat (not b!207924) (not start!20776) (not b!207926) (not mapNonEmpty!8999) tp_is_empty!5287)
(check-sat)

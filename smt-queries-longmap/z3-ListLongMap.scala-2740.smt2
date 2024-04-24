; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40244 () Bool)

(assert start!40244)

(declare-fun b!441901 () Bool)

(declare-fun res!261722 () Bool)

(declare-fun e!260120 () Bool)

(assert (=> b!441901 (=> (not res!261722) (not e!260120))))

(declare-datatypes ((array!27172 0))(
  ( (array!27173 (arr!13035 (Array (_ BitVec 32) (_ BitVec 64))) (size!13387 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27172)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27172 (_ BitVec 32)) Bool)

(assert (=> b!441901 (= res!261722 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!441902 () Bool)

(declare-fun res!261725 () Bool)

(assert (=> b!441902 (=> (not res!261725) (not e!260120))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!441902 (= res!261725 (validKeyInArray!0 k0!794))))

(declare-fun b!441903 () Bool)

(declare-fun res!261723 () Bool)

(assert (=> b!441903 (=> (not res!261723) (not e!260120))))

(declare-datatypes ((List!7725 0))(
  ( (Nil!7722) (Cons!7721 (h!8577 (_ BitVec 64)) (t!13473 List!7725)) )
))
(declare-fun arrayNoDuplicates!0 (array!27172 (_ BitVec 32) List!7725) Bool)

(assert (=> b!441903 (= res!261723 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7722))))

(declare-fun b!441904 () Bool)

(declare-fun res!261720 () Bool)

(assert (=> b!441904 (=> (not res!261720) (not e!260120))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!441904 (= res!261720 (or (= (select (arr!13035 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13035 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!261724 () Bool)

(assert (=> start!40244 (=> (not res!261724) (not e!260120))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40244 (= res!261724 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13387 _keys!709))))))

(assert (=> start!40244 e!260120))

(assert (=> start!40244 true))

(declare-datatypes ((V!16675 0))(
  ( (V!16676 (val!5883 Int)) )
))
(declare-datatypes ((ValueCell!5495 0))(
  ( (ValueCellFull!5495 (v!8131 V!16675)) (EmptyCell!5495) )
))
(declare-datatypes ((array!27174 0))(
  ( (array!27175 (arr!13036 (Array (_ BitVec 32) ValueCell!5495)) (size!13388 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27174)

(declare-fun e!260125 () Bool)

(declare-fun array_inv!9526 (array!27174) Bool)

(assert (=> start!40244 (and (array_inv!9526 _values!549) e!260125)))

(declare-fun array_inv!9527 (array!27172) Bool)

(assert (=> start!40244 (array_inv!9527 _keys!709)))

(declare-fun mapIsEmpty!19137 () Bool)

(declare-fun mapRes!19137 () Bool)

(assert (=> mapIsEmpty!19137 mapRes!19137))

(declare-fun b!441905 () Bool)

(declare-fun res!261726 () Bool)

(assert (=> b!441905 (=> (not res!261726) (not e!260120))))

(assert (=> b!441905 (= res!261726 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13387 _keys!709))))))

(declare-fun b!441906 () Bool)

(declare-fun e!260122 () Bool)

(assert (=> b!441906 (= e!260125 (and e!260122 mapRes!19137))))

(declare-fun condMapEmpty!19137 () Bool)

(declare-fun mapDefault!19137 () ValueCell!5495)

(assert (=> b!441906 (= condMapEmpty!19137 (= (arr!13036 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5495)) mapDefault!19137)))))

(declare-fun b!441907 () Bool)

(declare-fun e!260124 () Bool)

(assert (=> b!441907 (= e!260120 e!260124)))

(declare-fun res!261729 () Bool)

(assert (=> b!441907 (=> (not res!261729) (not e!260124))))

(declare-fun lt!203070 () array!27172)

(assert (=> b!441907 (= res!261729 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203070 mask!1025))))

(assert (=> b!441907 (= lt!203070 (array!27173 (store (arr!13035 _keys!709) i!563 k0!794) (size!13387 _keys!709)))))

(declare-fun b!441908 () Bool)

(declare-fun res!261728 () Bool)

(assert (=> b!441908 (=> (not res!261728) (not e!260120))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!441908 (= res!261728 (validMask!0 mask!1025))))

(declare-fun b!441909 () Bool)

(assert (=> b!441909 (= e!260124 false)))

(declare-fun lt!203069 () Bool)

(assert (=> b!441909 (= lt!203069 (arrayNoDuplicates!0 lt!203070 #b00000000000000000000000000000000 Nil!7722))))

(declare-fun b!441910 () Bool)

(declare-fun tp_is_empty!11677 () Bool)

(assert (=> b!441910 (= e!260122 tp_is_empty!11677)))

(declare-fun b!441911 () Bool)

(declare-fun res!261727 () Bool)

(assert (=> b!441911 (=> (not res!261727) (not e!260120))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!441911 (= res!261727 (and (= (size!13388 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13387 _keys!709) (size!13388 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!441912 () Bool)

(declare-fun e!260123 () Bool)

(assert (=> b!441912 (= e!260123 tp_is_empty!11677)))

(declare-fun b!441913 () Bool)

(declare-fun res!261721 () Bool)

(assert (=> b!441913 (=> (not res!261721) (not e!260120))))

(declare-fun arrayContainsKey!0 (array!27172 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!441913 (= res!261721 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!19137 () Bool)

(declare-fun tp!37101 () Bool)

(assert (=> mapNonEmpty!19137 (= mapRes!19137 (and tp!37101 e!260123))))

(declare-fun mapKey!19137 () (_ BitVec 32))

(declare-fun mapRest!19137 () (Array (_ BitVec 32) ValueCell!5495))

(declare-fun mapValue!19137 () ValueCell!5495)

(assert (=> mapNonEmpty!19137 (= (arr!13036 _values!549) (store mapRest!19137 mapKey!19137 mapValue!19137))))

(assert (= (and start!40244 res!261724) b!441908))

(assert (= (and b!441908 res!261728) b!441911))

(assert (= (and b!441911 res!261727) b!441901))

(assert (= (and b!441901 res!261722) b!441903))

(assert (= (and b!441903 res!261723) b!441905))

(assert (= (and b!441905 res!261726) b!441902))

(assert (= (and b!441902 res!261725) b!441904))

(assert (= (and b!441904 res!261720) b!441913))

(assert (= (and b!441913 res!261721) b!441907))

(assert (= (and b!441907 res!261729) b!441909))

(assert (= (and b!441906 condMapEmpty!19137) mapIsEmpty!19137))

(assert (= (and b!441906 (not condMapEmpty!19137)) mapNonEmpty!19137))

(get-info :version)

(assert (= (and mapNonEmpty!19137 ((_ is ValueCellFull!5495) mapValue!19137)) b!441912))

(assert (= (and b!441906 ((_ is ValueCellFull!5495) mapDefault!19137)) b!441910))

(assert (= start!40244 b!441906))

(declare-fun m!428903 () Bool)

(assert (=> b!441909 m!428903))

(declare-fun m!428905 () Bool)

(assert (=> b!441903 m!428905))

(declare-fun m!428907 () Bool)

(assert (=> b!441904 m!428907))

(declare-fun m!428909 () Bool)

(assert (=> b!441908 m!428909))

(declare-fun m!428911 () Bool)

(assert (=> start!40244 m!428911))

(declare-fun m!428913 () Bool)

(assert (=> start!40244 m!428913))

(declare-fun m!428915 () Bool)

(assert (=> b!441913 m!428915))

(declare-fun m!428917 () Bool)

(assert (=> b!441902 m!428917))

(declare-fun m!428919 () Bool)

(assert (=> mapNonEmpty!19137 m!428919))

(declare-fun m!428921 () Bool)

(assert (=> b!441907 m!428921))

(declare-fun m!428923 () Bool)

(assert (=> b!441907 m!428923))

(declare-fun m!428925 () Bool)

(assert (=> b!441901 m!428925))

(check-sat (not mapNonEmpty!19137) (not b!441908) (not b!441909) (not b!441901) (not start!40244) (not b!441903) (not b!441907) (not b!441902) tp_is_empty!11677 (not b!441913))
(check-sat)

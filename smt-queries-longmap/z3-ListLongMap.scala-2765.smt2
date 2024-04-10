; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40444 () Bool)

(assert start!40444)

(declare-fun b!445004 () Bool)

(declare-fun e!261636 () Bool)

(declare-fun tp_is_empty!11829 () Bool)

(assert (=> b!445004 (= e!261636 tp_is_empty!11829)))

(declare-fun mapNonEmpty!19371 () Bool)

(declare-fun mapRes!19371 () Bool)

(declare-fun tp!37353 () Bool)

(declare-fun e!261634 () Bool)

(assert (=> mapNonEmpty!19371 (= mapRes!19371 (and tp!37353 e!261634))))

(declare-datatypes ((V!16877 0))(
  ( (V!16878 (val!5959 Int)) )
))
(declare-datatypes ((ValueCell!5571 0))(
  ( (ValueCellFull!5571 (v!8210 V!16877)) (EmptyCell!5571) )
))
(declare-fun mapRest!19371 () (Array (_ BitVec 32) ValueCell!5571))

(declare-fun mapKey!19371 () (_ BitVec 32))

(declare-datatypes ((array!27465 0))(
  ( (array!27466 (arr!13180 (Array (_ BitVec 32) ValueCell!5571)) (size!13532 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27465)

(declare-fun mapValue!19371 () ValueCell!5571)

(assert (=> mapNonEmpty!19371 (= (arr!13180 _values!549) (store mapRest!19371 mapKey!19371 mapValue!19371))))

(declare-fun b!445005 () Bool)

(assert (=> b!445005 (= e!261634 tp_is_empty!11829)))

(declare-fun b!445006 () Bool)

(declare-fun res!263978 () Bool)

(declare-fun e!261633 () Bool)

(assert (=> b!445006 (=> (not res!263978) (not e!261633))))

(declare-datatypes ((array!27467 0))(
  ( (array!27468 (arr!13181 (Array (_ BitVec 32) (_ BitVec 64))) (size!13533 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27467)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27467 (_ BitVec 32)) Bool)

(assert (=> b!445006 (= res!263978 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun res!263973 () Bool)

(assert (=> start!40444 (=> (not res!263973) (not e!261633))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40444 (= res!263973 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13533 _keys!709))))))

(assert (=> start!40444 e!261633))

(assert (=> start!40444 true))

(declare-fun e!261638 () Bool)

(declare-fun array_inv!9556 (array!27465) Bool)

(assert (=> start!40444 (and (array_inv!9556 _values!549) e!261638)))

(declare-fun array_inv!9557 (array!27467) Bool)

(assert (=> start!40444 (array_inv!9557 _keys!709)))

(declare-fun b!445007 () Bool)

(declare-fun res!263971 () Bool)

(assert (=> b!445007 (=> (not res!263971) (not e!261633))))

(declare-datatypes ((List!7882 0))(
  ( (Nil!7879) (Cons!7878 (h!8734 (_ BitVec 64)) (t!13640 List!7882)) )
))
(declare-fun arrayNoDuplicates!0 (array!27467 (_ BitVec 32) List!7882) Bool)

(assert (=> b!445007 (= res!263971 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7879))))

(declare-fun b!445008 () Bool)

(declare-fun res!263974 () Bool)

(assert (=> b!445008 (=> (not res!263974) (not e!261633))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!445008 (= res!263974 (or (= (select (arr!13181 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13181 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!445009 () Bool)

(declare-fun res!263977 () Bool)

(assert (=> b!445009 (=> (not res!263977) (not e!261633))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!27467 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!445009 (= res!263977 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!445010 () Bool)

(declare-fun e!261635 () Bool)

(assert (=> b!445010 (= e!261635 false)))

(declare-fun lt!203578 () Bool)

(declare-fun lt!203579 () array!27467)

(assert (=> b!445010 (= lt!203578 (arrayNoDuplicates!0 lt!203579 #b00000000000000000000000000000000 Nil!7879))))

(declare-fun b!445011 () Bool)

(declare-fun res!263972 () Bool)

(assert (=> b!445011 (=> (not res!263972) (not e!261633))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!445011 (= res!263972 (validMask!0 mask!1025))))

(declare-fun b!445012 () Bool)

(declare-fun res!263979 () Bool)

(assert (=> b!445012 (=> (not res!263979) (not e!261633))))

(assert (=> b!445012 (= res!263979 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13533 _keys!709))))))

(declare-fun b!445013 () Bool)

(assert (=> b!445013 (= e!261638 (and e!261636 mapRes!19371))))

(declare-fun condMapEmpty!19371 () Bool)

(declare-fun mapDefault!19371 () ValueCell!5571)

(assert (=> b!445013 (= condMapEmpty!19371 (= (arr!13180 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5571)) mapDefault!19371)))))

(declare-fun mapIsEmpty!19371 () Bool)

(assert (=> mapIsEmpty!19371 mapRes!19371))

(declare-fun b!445014 () Bool)

(declare-fun res!263975 () Bool)

(assert (=> b!445014 (=> (not res!263975) (not e!261633))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!445014 (= res!263975 (and (= (size!13532 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13533 _keys!709) (size!13532 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!445015 () Bool)

(assert (=> b!445015 (= e!261633 e!261635)))

(declare-fun res!263976 () Bool)

(assert (=> b!445015 (=> (not res!263976) (not e!261635))))

(assert (=> b!445015 (= res!263976 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203579 mask!1025))))

(assert (=> b!445015 (= lt!203579 (array!27468 (store (arr!13181 _keys!709) i!563 k0!794) (size!13533 _keys!709)))))

(declare-fun b!445016 () Bool)

(declare-fun res!263980 () Bool)

(assert (=> b!445016 (=> (not res!263980) (not e!261633))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!445016 (= res!263980 (validKeyInArray!0 k0!794))))

(assert (= (and start!40444 res!263973) b!445011))

(assert (= (and b!445011 res!263972) b!445014))

(assert (= (and b!445014 res!263975) b!445006))

(assert (= (and b!445006 res!263978) b!445007))

(assert (= (and b!445007 res!263971) b!445012))

(assert (= (and b!445012 res!263979) b!445016))

(assert (= (and b!445016 res!263980) b!445008))

(assert (= (and b!445008 res!263974) b!445009))

(assert (= (and b!445009 res!263977) b!445015))

(assert (= (and b!445015 res!263976) b!445010))

(assert (= (and b!445013 condMapEmpty!19371) mapIsEmpty!19371))

(assert (= (and b!445013 (not condMapEmpty!19371)) mapNonEmpty!19371))

(get-info :version)

(assert (= (and mapNonEmpty!19371 ((_ is ValueCellFull!5571) mapValue!19371)) b!445005))

(assert (= (and b!445013 ((_ is ValueCellFull!5571) mapDefault!19371)) b!445004))

(assert (= start!40444 b!445013))

(declare-fun m!430669 () Bool)

(assert (=> b!445008 m!430669))

(declare-fun m!430671 () Bool)

(assert (=> mapNonEmpty!19371 m!430671))

(declare-fun m!430673 () Bool)

(assert (=> b!445016 m!430673))

(declare-fun m!430675 () Bool)

(assert (=> b!445007 m!430675))

(declare-fun m!430677 () Bool)

(assert (=> b!445006 m!430677))

(declare-fun m!430679 () Bool)

(assert (=> start!40444 m!430679))

(declare-fun m!430681 () Bool)

(assert (=> start!40444 m!430681))

(declare-fun m!430683 () Bool)

(assert (=> b!445010 m!430683))

(declare-fun m!430685 () Bool)

(assert (=> b!445011 m!430685))

(declare-fun m!430687 () Bool)

(assert (=> b!445009 m!430687))

(declare-fun m!430689 () Bool)

(assert (=> b!445015 m!430689))

(declare-fun m!430691 () Bool)

(assert (=> b!445015 m!430691))

(check-sat (not b!445015) (not b!445016) (not start!40444) (not b!445009) tp_is_empty!11829 (not b!445010) (not b!445011) (not b!445006) (not mapNonEmpty!19371) (not b!445007))
(check-sat)
